{
  flake.modules.nixos.common =
    { config, pkgs, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
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
