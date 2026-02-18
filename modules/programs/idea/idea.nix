{
  flake.modules.homeManager.idea =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        jetbrains.idea
      ];
    };
}
