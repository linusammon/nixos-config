{
  flake.modules.nixos.common = {
    programs.nix-index.enable = true;

    custom.persist.user.directories = [
      ".cache/nix-index"
    ];
  };
}
