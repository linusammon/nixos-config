{ self, inputs, ... }:
{
  formatter = self.lib.perSystem (
    pkgs:
    inputs.treefmt-nix.lib.mkWrapper pkgs {
      programs = {
        nixfmt.enable = true;
        statix.enable = true;
        deadnix.enable = true;
      };
    }
  );
}
