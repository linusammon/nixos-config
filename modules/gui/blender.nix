{
  modules.nixos.gui.blender = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.blender
    ];

    custom.persist.user.directories = [
      ".config/blender"
    ];
  };
}
