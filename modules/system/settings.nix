{
  modules.nixos.system.settings = { config, ... }: {
    system.stateVersion = config.system.nixos.release;

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
          "https://noctalia.cachix.org"
          "https://linusammon.cachix.org"
        ];

        extra-trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "linusammon.cachix.org-1:g0X9oaHIZ5j48dsqfu8ZEdAp6HA2pH7Buv5Ye698qfc="
        ];
      };
    };
  };
}
