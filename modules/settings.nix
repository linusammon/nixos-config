{ self, ... }:
{
  flake.modules.nixos.common =
    {
      config,
      pkgs,
      ...
    }:
    let
      inherit (config.custom.constants) host;
    in
    {
      networking.hostName = host;

      console.keyMap = "de";

      time.timeZone = "Europe/Zurich";

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
