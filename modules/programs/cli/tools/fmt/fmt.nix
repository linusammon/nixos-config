{
  flake.modules.homeManager.fmt =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        treefmt
        nixfmt
      ];
    };
}
