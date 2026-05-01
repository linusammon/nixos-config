{
  flake.modules.nixos.common = {
    programs.nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = false;
      enableBashIntegration = false;
    };

    custom.persist.user.directories = [
      ".cache/nix-index"
    ];
  };
}
