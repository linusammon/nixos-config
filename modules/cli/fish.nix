{
  modules.nixos.cli.fish = { pkgs, user, ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };

    users.users.${user}.shell = pkgs.fish;

    custom.persist.user.files = [
      ".local/share/fish/fish_history"
    ];
  };
}
