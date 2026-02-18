{
  flake.modules.homeManager.zip =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        zip
        unzip
      ];
    };
}
