{
  flake.modules.nixos.xdg =
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

      persistence.user = {
        directories = [
          "Downloads"
          "Documents"
          "Projects"
          "Pictures"
          "Videos"
          "Music"
        ];
      };
    };
}
