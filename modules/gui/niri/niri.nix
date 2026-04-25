{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrappers.wrappers.niri.wrap {
        inherit pkgs;
        package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.default;
        settings = import ./_settings.nix;
      };
    };

  flake.modules.nixos.programs_niri =
    { pkgs, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
      };

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        bibata-cursors
      ];
    };
}
