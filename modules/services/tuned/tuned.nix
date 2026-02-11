{
  flake.modules.nixos.tuned = {
    services.tuned.enable = true;
  };
}
