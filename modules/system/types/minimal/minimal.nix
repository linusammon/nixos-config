{ self, ... }:
{
  flake.modules.nixos.system-minimal = {
    imports = with self.modules.nixos; [
      nixos
      impermanence
      boot
      user
    ];

    system.stateVersion = "26.05";

  };
}
