{
  self,
  inputs,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    tmux = inputs.nix-wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;
      mouse = false;
      prefix = "C-space";
      modeKeys = "vi";
      statusKeys = "vi";
      vimVisualKeys = true;
      escapeTime = 0;
      configAfter = ''
        unbind '"'
        unbind %

        bind s split-window -h
        bind v split-window -v

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5

        set -g status off

        set -g pane-border-style fg=colour240
        set -g pane-active-border-style fg=white
      '';
    };
  });

  modules.nixos.cli.tmux = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
    ];
  };
}
