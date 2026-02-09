{
  flake.modules.homeManager.kdenlive =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kdePackages.kdenlive
      ];
    };
}
