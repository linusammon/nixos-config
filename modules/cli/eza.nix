{ self, inputs, ... }:
{
  packages = self.lib.perSystem (pkgs: {
    eza = inputs.nix-wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.eza;
      flags = {
        "--icons" = true;
        "--group-directories-first" = true;
        "--hyperlink" = true;
        "--no-user" = true;
        "--time-style" = "+%Y-%m-%d %H:%M";
      };
    };
  });

  modules.nixos.cli.eza = { pkgs, ... }: {
    environment = {
      systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.eza ];

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
