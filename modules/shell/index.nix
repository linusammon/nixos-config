{
  flake.modules.nixos.common = {
    programs = {
      nix-index.enable = true;
      command-not-found.enable = false;
    };

    custom.persist.user.directories = [
      ".cache/nix-index"
    ];
  };
}
