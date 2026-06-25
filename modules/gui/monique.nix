{ inputs, ... }:
{
  modules.nixos.gui.monique = _: {
    imports = [ inputs.monique.nixosModules.default ];

    programs.monique.enable = true;

    custom.persist.user = {
      directories = [ ".config/monique" ];
      files = [
        ".config/niri/monitors.kdl"
        ".config/hypr/monitors.lua"
        ".config/hypr/monitors.conf"
        ".config/sway/monitors.conf"
      ];
    };
  };
}
