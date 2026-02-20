{
  flake.modules.homeManager.archive =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        zip
        unzip
        gnutar
      ];
    };
}
