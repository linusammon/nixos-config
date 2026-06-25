{
  modules.nixos.system.nixpkgs = { lib, system, ... }: {
    nixpkgs.hostPlatform = lib.mkDefault system;
    nixpkgs.config.allowUnfree = true;
  };
}
