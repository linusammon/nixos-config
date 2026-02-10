{ inputs, ... }:
{
  flake.modules.nixos.sddm = {
    imports = [ inputs.silentSDDM.nixosModules.default ];

    programs.silentSDDM = {
      enable = true;
      theme = "default";
      backgrounds = {
        "001.jpg" = "${inputs.wallpapers}/001.jpg";
      };
      settings = {
        "LoginScreen" = {
          background = "001.jpg";
        };
        "LockScreen" = {
          background = "001.jpg";
        };
      };
    };
  };
}
