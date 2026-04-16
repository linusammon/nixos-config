{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.eza = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.eza;
        flags = {
          "--icons" = true;
          "--group-directories-first" = true;
          "--hyperlink" = true;
          "--total-size" = true;
          "--no-user" = true;
          "--time-style" = "+%Y-%m-%d %H:%M";
        };
      };
    };

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
