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

  flake.modules.nixos.noctalia =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
      ];
    };
}
