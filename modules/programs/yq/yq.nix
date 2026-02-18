{
  flake.modules.homeManager.yq =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        yq-go
      ];
    };
}
