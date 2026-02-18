{
  flake.modules.homeManager.tar =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gnutar
      ];
    };
}
