{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.noctalia =
        (inputs.wrappers.wrappers.noctalia-shell.apply {
          inherit pkgs;
          package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
          settings = import ./_settings.nix;
          colors = import ./_colors.nix { inherit self; };
        }).wrapper;
    };

  flake.modules.nixos.programs_noctalia =
    { pkgs, ... }:
    {
      nix.settings = {
        extra-substituters = [ "https://noctalia.cachix.org" ];
        extra-trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };

      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
      ];
    };
}
