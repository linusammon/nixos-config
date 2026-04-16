{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.kitty =
        (inputs.wrappers.wrappers.kitty.apply {
          inherit pkgs;
          settings = import ./_settings.nix { inherit self; };
        }).wrapper;
    };

  flake.modules.nixos.kitty =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
      ];
    };
}
