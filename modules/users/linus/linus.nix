{
  self,
  lib,
  ...
}:
let
  username = "linus";
in
{
  flake.homeConfigurations = lib.mkHomeManager { username = "${username}"; };

  flake.modules = lib.mkMerge [
    (self.factory.user "${username}")
    {
      homeManager."${username}" = {
        imports = with self.modules.homeManager; [
          system-default
          noctalia
          stylix

          fish
          kitty
          starship
          btop
          fastfetch
          eza
          fzf
          zoxide
          cava
          clock

          nixcord
          thunderbird
          nautilus
          obsidian
          firefox

          idea
          vscode

          gimp
          kdenlive
          obs
          vlc
        ];
      };
    }
  ];
}
