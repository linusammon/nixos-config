{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "wsl" {
    modules =
      with self.modules.nixos;
      with self.lib;
      [
        (collect cli { })
        (collect system {
          exclude = [
            "boot"
            "impermanence"
            "ssh.server"
          ];
        })

        hardware.wsl
      ];
  };
}
