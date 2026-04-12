{ self, ... }:
{
  flake.modules.nixos.btop =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.btop
      ];
    };
}
