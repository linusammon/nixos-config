{
  modules.nixos.hardware.gpu.amd = _: {
    imports = [ ./_common.nix ];
    nixpkgs.config.rocmSupport = true;
  };
}
