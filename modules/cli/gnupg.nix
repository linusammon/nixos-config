{
  modules.nixos.cli.gnupg = _: {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    custom.persist.user.directories = [
      ".gnupg"
    ];
  };
}
