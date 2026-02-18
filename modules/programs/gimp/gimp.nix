{
  flake.modules.homeManager.gimp =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gimp
      ];
    };
}
