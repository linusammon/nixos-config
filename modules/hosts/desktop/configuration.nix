{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos "desktop" { };

  flake.modules.nixos.host_desktop = {
    imports = with self.modules.nixos; [
      wm_niri

      programs_noctalia
      programs_nautilus
      programs_kitty
      programs_zeditor
      programs_qutebrowser
      programs_discord

      specialisations_steam

      hardware_network
      hardware_keyboard
    ];
  };
}
