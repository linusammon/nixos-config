{
  outputs =
    { self, ... }:
    let
      tackInputs = import ./.tack;

      inherit (tackInputs.nixpkgs) lib;
      inherit (lib.fileset) toList fileFilter;

      isNixModule = file: file.hasExt "nix" && file.name != "flake.nix" && !lib.hasPrefix "_" file.name;

      importTree =
        path:
        toList (
          lib.fileset.intersection (lib.fileset.difference path (path + "/.tack")) (
            fileFilter isNixModule path
          )
        );

      inputs = tackInputs // {
        self = self';
      };

      self' = outputs // {
        inherit inputs;
        inherit (self) outPath;
      };

      outputs = tackInputs.flake-parts.lib.mkFlake { inherit inputs; } { imports = importTree ./.; };
    in
    outputs;
}
