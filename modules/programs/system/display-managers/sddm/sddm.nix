{ inputs, ... }:
{
  flake.modules.nixos.sddm = {
    imports = [ inputs.silentSDDM.nixosModules.default ];

    programs.silentSDDM = {
      enable = true;
      theme = "default";
    };
  };
}
