{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos "desktop" { };

  flake.modules.nixos.host_desktop = {
    imports = with self.modules.nixos; [
      programs_niri
      programs_noctalia
      programs_kitty
      programs_zeditor
      programs_qutebrowser
      programs_discord

      hardware_network
    ];
  };
}
