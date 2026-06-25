{ inputs, ... }: {
  formatter =
    pkgs:
    inputs.treefmt-nix.lib.mkWrapper pkgs {
      programs.nixfmt.enable = true;
      programs.statix.enable = true;
      programs.deadnix.enable = true;
    };
}
