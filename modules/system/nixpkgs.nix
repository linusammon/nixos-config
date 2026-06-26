{
  modules.nixos.system.nixpkgs = { lib, args, ... }: {
    nixpkgs.hostPlatform = lib.mkDefault args.hostPlatform;
    nixpkgs.config.allowUnfree = true;
  };
}
