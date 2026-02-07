{
  flake.modules.homeManager.nix =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nixd
        nixfmt
      ];
    };
}
