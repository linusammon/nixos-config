{
  flake.modules.nixos.common =
    { config, pkgs, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      users = {
        users = {
          root = {
            initialPassword = "password";
          };

          ${user} = {
            initialPassword = "password";
            isNormalUser = true;
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
          };
        };
      };

      environment = {
        systemPackages = with pkgs; [
          xdg-user-dirs
        ];

        etc."xdg/user-dirs.defaults".text = ''
          DOWNLOAD=Downloads
          DOCUMENTS=Documents
          PROJECTS=Projects
          PICTURES=Pictures
          VIDEOS=Videos
          MUSIC=Music
        '';
      };

      custom.persist.user.directories = [
        "Documents"
        "Projects"
        "Pictures"
        "Videos"
        "Music"
      ];
    };
}
