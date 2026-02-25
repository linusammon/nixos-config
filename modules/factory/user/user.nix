{ self, ... }:
{
  config.flake.factory.user =
    {
      name,
    }:
    let
      directory = "/home/${name}";
    in
    {
      nixos.${name} =
        { pkgs, ... }:
        {
          users.users.${name} = {
            isNormalUser = true;
            initialPassword = "changeme";
            home = directory;
            extraGroups = [
              "wheel"
              "networkmanager"
              "docker"
            ];
            shell = pkgs.fish;
          };

          programs.fish.enable = true;

          home-manager.users.${name} = {
            imports = [ self.modules.homeManager.${name} ];
          };
        };

      homeManager.${name} = {
        home = {
          username = name;
          homeDirectory = directory;
        };
      };
    };
}
