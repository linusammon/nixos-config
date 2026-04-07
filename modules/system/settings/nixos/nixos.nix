{ inputs, ... }:
{
  flake.modules.nixos.nixos =
    { pkgs, ... }:
    {
      i18n.defaultLocale = "en_US.UTF-8";

      documentation.nixos.enable = false;

      nix.settings = {
        auto-optimise-store = true;

        download-buffer-size = 1024 * 1024 * 1024;

        extra-substituters = [
          "https://noctalia.cachix.org"
          "https://attic.xuyh0120.win/lantian"
        ];

        extra-trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        ];

        experimental-features = [
          "nix-command"
          "flakes"
        ];

        trusted-users = [
          "root"
          "@wheel"
        ];
      };

      nixpkgs = {
        config.allowUnfree = true;

        overlays = [
          inputs.nix-cachyos-kernel.overlays.pinned
        ];
      };

      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

      programs.nix-ld.enable = true;
    };
}
