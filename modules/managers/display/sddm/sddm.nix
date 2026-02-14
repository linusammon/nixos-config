{ inputs, ... }:
{
  flake.modules.nixos.sddm = {
    imports = [ inputs.silentSDDM.nixosModules.default ];

    programs.silentSDDM = {
      enable = true;
      theme = "default";
      backgrounds = {
        "001.png" = ./../../../programs/desktop/theming/wallpapers/001.png;
      };
      settings = {
        "LoginScreen" = {
          background = "001.png";
        };
        "LockScreen" = {
          background = "001.png";
        };
      };
    };
  };
}
