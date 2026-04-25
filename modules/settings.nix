{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) host;
    in
    {
      networking.hostName = host;

      networking.networkmanager.enable = true;

      time.timeZone = "Europe/Zurich";

      console.keyMap = "de";

      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [ "de_CH.UTF-8/UTF-8" ];
        extraLocaleSettings = {
          LC_TIME = "de_CH.UTF-8";
          LC_MONETARY = "de_CH.UTF-8";
          LC_MEASUREMENT = "de_CH.UTF-8";
          LC_NUMERIC = "de_CH.UTF-8";
          LC_PAPER = "de_CH.UTF-8";
          LC_ADDRESS = "de_CH.UTF-8";
          LC_TELEPHONE = "de_CH.UTF-8";
          LC_NAME = "de_CH.UTF-8";
        };
      };

      programs.nix-ld.enable = true;

      documentation.nixos.enable = false;

      nix = {
        channel.enable = false;
        settings = {
          extra-substituters = [
            "https://attic.xuyh0120.win/lantian"
            "https://noctalia.cachix.org"
            "https://niri.cachix.org"
          ];
          extra-trusted-public-keys = [
            "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
          ];

          experimental-features = [
            "flakes"
            "nix-command"
            "pipe-operators"
          ];

          trusted-users = [
            "root"
            "@wheel"
          ];
        };
      };

      nixpkgs.config.allowUnfree = true;

      system.stateVersion = "26.05";
    };
}
