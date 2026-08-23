{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "work" {
    scope = "work";
    modules =
      with self.modules.nixos;
      with self.lib;
      [
        (collect cli { })
        (collect system {
          exclude = [
            "boot"
            "impermanence"
            "openssh"
          ];
        })

        secrets

        hardware.wsl
      ];
  };
}
