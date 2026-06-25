{
  modules.nixos.hardware.gpu.intel = { pkgs, ... }: {
    imports = [ ./_common.nix ];
    hardware.graphics.extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };
}
