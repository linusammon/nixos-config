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
          idea
          kitty
          nixcord
          noctalia
          ssh
          starship
          stylix
          thunderbird
          userdirs
          wget
          zoxide
        ];

        programs.git.settings.user = {
          name = "Linus Ammon";
          email = "235536459+linusammon@users.noreply.github.com";
        };
      };
    }
  ];
}
