{
  flake-file.inputs = {
    stylix = {
      url = "github:make-42/stylix/matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
