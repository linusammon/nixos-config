{
  flake.modules.nixos.programs_gimp =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gimp
      ];

      custom.persist.user.directories = [
        ".config/GIMP"
      ];
    };
}
