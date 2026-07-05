{
  modules.nixos.system.settings = { config, args, ... }: {
    networking = { inherit (args) hostName; };

    system.stateVersion = config.system.nixos.release;

    nix = {
      channel.enable = false;
      settings = {
        experimental-features = [
          "flakes"
          "nix-command"
          "pipe-operators"
        ];

        trusted-users = [
          "@wheel"
        ];
      };
    };
  };
}
