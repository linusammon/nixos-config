{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos "zenbook" { };

  flake.modules.nixos.host_zenbook = {
    imports = with self.modules.nixos; [
      wm_niri

      programs_noctalia
      programs_nautilus
      programs_kitty
      programs_zeditor
      programs_qutebrowser
      programs_discord

      hardware_network
      hardware_graphics
      hardware_battery
      hardware_bluetooth
      hardware_keyboard
    ];
  };
}
