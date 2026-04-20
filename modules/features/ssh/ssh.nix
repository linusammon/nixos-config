{
  flake.modules.nixos.ssh = {
    persistence.user.directories = [
      ".ssh"
    ];
  };
}
