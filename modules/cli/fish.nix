{
  modules.nixos.cli.fish = { pkgs, args, ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };

    users.users.${args.user}.shell = pkgs.fish;

    custom.persist.user.files = [
      ".local/share/fish/fish_history"
    ];
  };
}
