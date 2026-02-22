{
  flake.modules.nixos.nixos = {
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
