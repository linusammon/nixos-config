{
  flake.modules.nixos.nixos = {
    i18n.defaultLocale = "en_US.UTF-8";

    documentation.nixos.enable = false;

    nix.settings = {
      auto-optimise-store = true;

      download-buffer-size = 1024 * 1024 * 1024;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    nixpkgs.config.allowUnfree = true;
  };
}
