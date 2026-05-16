{ self, ... }:
{
  flake.modules.nixos.common =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      inherit (config.custom.constants) host;
    in
    {
      networking.hostName = host;

      console.keyMap = "de";

      time.timeZone = "Europe/Zurich";

      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [ "de_CH.UTF-8/UTF-8" ];
        extraLocaleSettings = lib.genAttrs [
          "LC_TIME"
          "LC_MONETARY"
          "LC_MEASUREMENT"
          "LC_NUMERIC"
          "LC_PAPER"
          "LC_ADDRESS"
          "LC_TELEPHONE"
          "LC_NAME"
        ] (_: "de_CH.UTF-8");
      };

      fonts = with self.fonts; {
        fontconfig.defaultFonts = {
          sansSerif = [ sans ];
          serif = [ serif ];
          monospace = [ mono ];
        };

        packages = packages pkgs;
      };

      documentation.nixos.enable = false;

      programs.nix-ld.enable = true;

      nixpkgs.config.allowUnfree = true;

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

          extra-substituters = [
            "https://linusammon.cachix.org"
          ];

          extra-trusted-public-keys = [
            "linusammon.cachix.org-1:g0X9oaHIZ5j48dsqfu8ZEdAp6HA2pH7Buv5Ye698qfc="
          ];
        };
      };

      system.stateVersion = "26.05";
    };
}
