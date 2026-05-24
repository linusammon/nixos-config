{
  flake.modules.nixos.common = {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    custom.persist.user.directories = [
      ".gnupg"
    ];
  };
}
