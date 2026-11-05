{
  self,
  inputs,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    tmux = inputs.nix-wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;
      prefix = "C-space";
      modeKeys = "vi";
      statusKeys = "vi";
      vimVisualKeys = true;
      escapeTime = 0;
      configAfter = with self.theme.colors; ''
        set -g history-limit 50000

        bind v split-window -h -c "#{pane_current_path}"
        bind s split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5

        set -g default-terminal "tmux-256color"
        set -as terminal-features ",*:RGB"

        set -g status-position top
        set -g status-style "bg=${base00},fg=${base04}"
        set -g status-left ""
        set -g status-right ""
        set -g status-justify left
        
        set -g window-status-separator ""
        set -g window-status-format " #I #W "
        set -g window-status-style "fg=${base04},bg=${base00}"
        set -g window-status-current-format " #I #W#{?window_zoomed_flag, Z,} "
        set -g window-status-current-style "fg=${base07},bg=${base02},bold"
        set -g window-status-activity-style "fg=${base0A}"
        set -g window-status-bell-style "fg=${base08},bold"
        
        set -g pane-border-style "fg=${base02}"
        set -g pane-active-border-style "fg=${base0D}"
        set -g display-panes-colour "${base03}"
        set -g display-panes-active-colour "${base0D}"
        set -g pane-scrollbars on
        set -g pane-scrollbars-position right
        set -g pane-scrollbars-style "fg=${base03},bg=${base00}"

        set -g mode-style "bg=${base0D},fg=${base00}"
        set -g message-style "bg=${base02},fg=${base05}"
        set -g message-command-style "bg=${base02},fg=${base0A}"
        set -g clock-mode-colour "${base0D}"
        set -g popup-style "bg=${base00},fg=${base05}"
        set -g popup-border-style "fg=${base03}"
      '';
    };
  });

  modules.nixos.cli.tmux =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.tmux;
    in
    {
      environment.systemPackages = [ pkg ];

      programs.fish.interactiveShellInit = ''
        if not set -q TMUX
          ${lib.getExe pkg}
        end
      '';
    };
}
