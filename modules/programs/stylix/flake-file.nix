{
  flake-file.inputs = {
    stylix = {
      url = "github:linusammon/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
