{ inputs, ... }:
{
  modules.nixos.system.kernel = { pkgs, ... }: {
    nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  };
}
