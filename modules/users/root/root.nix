{
  flake.modules.nixos.root = {
    users.users.root.initialPassword = "changeme";
  };
}
