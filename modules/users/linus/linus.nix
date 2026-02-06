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
      homeManager."${username}" =
        { pkgs, ... }:
        {
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
            btop
            zoxide
            eza
            fzf
          ];

          home.packages = with pkgs; [
            vscode
            nixd
          ];
        };
    }
  ];
}
