{ inputs, ... }: {
  modules.nixos.gui.minecraft = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    ];

    custom.persist.user.directories = [
      ".local/share/FreesmLauncher"
    ];

    # needed for noctalia community server oauth address to resolve correctly
    networking.nftables = {
      enable = true;
      tables."discord-oauth-redirect" = {
        family = "ip";
        content = ''
          chain output {
            type nat hook output priority -100;
            ip daddr 217.118.201.137 tcp dport 27214 dnat to 172.28.7.14:27214
          }
        '';
      };
    };
  };
}
