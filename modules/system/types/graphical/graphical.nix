{ self, ... }:
{
  flake.modules.nixos.system-graphical = {
    imports = with self.modules.nixos; [
      system-default

      sddm
      niri

      # TODO: After migrating all home-manager modules, refactor system/types to accommodate for them
      btop
      eza
      fzf
      nh
      starship
      zoxide
    ];
  };
}
