{
  flake.modules.nixos.programs_blender =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.blender
      ];

      custom.persist.user.directories = [
        ".config/blender"
      ];
    };
}
