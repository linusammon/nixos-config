{
  flake.modules.nixos.programs_nautilus =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.nautilus ];

      services = {
        gvfs.enable = true;
        udisks2.enable = true;
      };
    };
}
