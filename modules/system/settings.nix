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
          "https://attic.xuyh0120.win/lantian"
          "https://noctalia.cachix.org"
          "https://linusammon.cachix.org"
        ];

        extra-trusted-public-keys = [
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "linusammon.cachix.org-1:g0X9oaHIZ5j48dsqfu8ZEdAp6HA2pH7Buv5Ye698qfc="
        ];
      };
    };
  };
}
