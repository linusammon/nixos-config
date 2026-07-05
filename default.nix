{
  tackOverrides ? { },
}:
let
  inputs = import ./.tack { overrides = tackOverrides; };

  lib = inputs.nixpkgs.lib;
  inherit (lib) evalModules hasPrefix mapAttrs;
  inherit (lib.fileset) fileFilter toList;

  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = f: lib.genAttrs systems (system: f inputs.nixpkgs.legacyPackages.${system});

  importTree =
    path: path |> fileFilter (file: with file; hasExt "nix" && !hasPrefix "_" name) |> toList;

  inherit
    (evalModules {
      modules = importTree ./modules ++ [ ./top.nix ];
      specialArgs = { inherit inputs lib; };
    })
    config
    ;
in
{
  inherit (config) nixosConfigurations;
  packages = perSystem (pkgs: mapAttrs (_: f: f pkgs) config.packages);
  formatter = perSystem (pkgs: config.formatter pkgs);
}
