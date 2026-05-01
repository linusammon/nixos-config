{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) host;
    in
    {
      networking.hostName = host;

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
          experimental-features = [
            "flakes"
            "nix-command"
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
