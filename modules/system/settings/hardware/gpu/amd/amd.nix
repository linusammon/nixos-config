{
  flake.modules.nixos.gpu-amd = {
    hardware.amdgpu.initrd.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
