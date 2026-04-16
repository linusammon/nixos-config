{
  flake.modules.nixos.fish = {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
      '';
    };

    persistence.user.files = [
      ".local/share/fish/fish_history"
    ];
  };
}
