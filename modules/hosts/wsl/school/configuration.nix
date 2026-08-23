{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "school" {
    scope = "school";
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
