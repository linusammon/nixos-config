{ self, ... }:
{
  flake.modules.nixos.system-minimal = {
    imports = with self.modules.nixos; [
      nix
      nixpkgs
    ];

    system.stateVersion = "26.05";
  };
}
