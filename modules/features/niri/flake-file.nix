{
  flake-file.inputs = {
    niri = {
      url = "github:niri-wm/niri?ref=wip/branch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
