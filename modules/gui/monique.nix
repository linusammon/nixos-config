{ inputs, ... }:
{
  modules.nixos.gui.monique = _: {
    imports = [ inputs.monique.nixosModules.default ];

    programs.monique.enable = true;

    custom.persist.user.directories = [ ".config/monique" ];
  };
}
