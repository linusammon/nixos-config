{ inputs, ... }:
{
  flake.modules.nixos.sddm =
    let
      wallpaper = "001.png";
    in
    {
      imports = [ inputs.silentSDDM.nixosModules.default ];

      programs.silentSDDM = {
        enable = true;
        theme = "default";
        backgrounds = {
          "${wallpaper}" = "${inputs.wallpapers}/${wallpaper}";
        };
        settings = {
          "LoginScreen" = {
            background = "${wallpaper}";
          };
          "LockScreen" = {
            background = "${wallpaper}";
          };
        };
      };

      environment.persistence."/persist".directories = [
        "/etc/sddm.conf"
      ];
    };
}
