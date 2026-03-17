{
  flake-file.inputs = {
    niri = {
      url = "github:niri-wm/niri?rev=92c168f56d6653c4899222c235fdd6467c1c351b";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
