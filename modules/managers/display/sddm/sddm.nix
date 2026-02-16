{ inputs, ... }:
{
  flake.modules.nixos.sddm =
    let
      wallpaper = "004.png";
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
    };
}
