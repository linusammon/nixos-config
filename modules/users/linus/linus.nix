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
            eza

            git
            fmt
            nh
          ];

          home.packages = with pkgs; [
            vscode
            nixd
          ];
        };
    }
  ];
}
