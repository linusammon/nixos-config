{ self, lib, ... }:
let
  name = "linus";
in
{
  flake.homeConfigurations = lib.mkHomeManager { inherit name; };

  flake.modules = lib.mkMerge [
    (self.factory.user { inherit name; })
    {
      homeManager.${name} = {
        imports = with self.modules.homeManager; [
          archive
          btop
          eza
          fastfetch
          firefox
          fish
          fzf
          kitty
          nautilus
          nixcord
          noctalia
          media
          ssh
          starship
          stylix
          thunderbird
          wget
          zed
          xdg
          zoxide
        ];
      };
    }
  ];
}
