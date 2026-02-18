{
  flake.modules.homeManager.nautilus =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ nautilus ];
    };
}
