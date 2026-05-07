{
  flake.modules.nixos.common =
    { pkgs, ... }:
    {
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
