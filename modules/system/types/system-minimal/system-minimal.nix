{ self, ... }:
let
  stateVersion = "26.05";
in
{
  flake.modules.nixos.system-minimal = {
    imports = with self.modules.nixos; [
      nixos
    ];

    system.stateVersion = "${stateVersion}";
  };

  flake.modules.homeManager.system-minimal = {
    home.stateVersion = "${stateVersion}";
  };
}
