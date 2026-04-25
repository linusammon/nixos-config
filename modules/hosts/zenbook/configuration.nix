{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos "zenbook" { };

  flake.modules.nixos.host_zenbook = {
    imports = with self.modules.nixos; [
      programs_niri
      programs_noctalia
      programs_kitty
      programs_zeditor
      programs_qutebrowser
      programs_discord

      hardware_network
      hardware_battery
      hardware_bluetooth
    ];
  };
}
