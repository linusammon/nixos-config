{ self, lib, ... }:
let
  name = "linus";
in
{
  flake.homeConfigurations = lib.mkHomeManager { inherit name; };

  flake.modules = lib.mkMerge [
    (self.factory.user { inherit name; })
    {
      homeManager.${name} =
        { pkgs, ... }:
        {
          imports = with self.modules.homeManager; [
            kitty
            noctalia
          ];

          home.packages = with pkgs; [

          ];

          programs.git.settings.user = {
            name = "Linus Ammon";
            email = "235536459+linusammon@users.noreply.github.com";
          };
        };
    }
  ];
}
