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
          system-desktop

          noctalia

          nixcord
          nautilus
          obsidian
          thunderbird
          firefox

          kitty

          fish

          starship
          fastfetch
          cava
          clock
          btop
          zoxide
          eza
          fzf

          idea
          vscode

          cliphist

          gimp
        ];
      };
    }
  ];
}
