{ self, ... }:
{
  flake.modules.nixos.system-graphical = {
    imports = with self.modules.nixos; [
      system-default

      autoLogin
      niri
      hjem

      # TODO: After migrating all home-manager modules, refactor system/types to accommodate for them
      btop
      eza
      fish
      fzf
      git
      kitty
      nh
      nixcord
      noctalia
      qutebrowser
      ssh
      starship
      steam
      thunderbird
      zeditor
      zoxide
      xdg
    ];
  };
}
