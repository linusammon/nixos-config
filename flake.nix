{
  inputs = {
    disko.url = "github:nix-community/disko";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager/master";
    impermanence.url = "github:nix-community/impermanence";
    import-tree.url = "github:vic/import-tree";
    niri.url = "github:niri-wm/niri?ref=wip/branch";
    nixcord.url = "github:FlameFlag/nixcord";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    silentSDDM.url = "github:uiriansan/SilentSDDM";
    stylix.url = "github:linusammon/stylix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
