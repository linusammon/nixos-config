{ self, ... }:
{
  config.flake.factory.user =
    username:
    let
      directory = "/home/${username}";
    in
    {
      nixos."${username}" =
        { pkgs, ... }:
        {
          users.users."${username}" = {
            isNormalUser = true;
            home = "${directory}";
            extraGroups = [
              "wheel"
              "networkmanager"
            ];
            shell = pkgs.fish;
          };

          programs.fish.enable = true;

          home-manager.users."${username}" = {
            imports = [ self.modules.homeManager."${username}" ];
          };
        };

      homeManager."${username}" = {
        home = {
          username = "${username}";
          homeDirectory = "${directory}";
        };
      };
    };
}
