{ self, ... }:
{
  flake.modules.nixos.eza =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.eza
        ];

        shellAliases = {
          ls = "eza";
          ll = "eza -l";
          la = "eza -a";
          lla = "eza -la";
          lt = "eza --tree";
        };
      };
    };
}
