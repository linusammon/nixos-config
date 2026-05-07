{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      users = {
        users = {
          root = {
            initialPassword = "password";
          };

          ${user} = {
            initialPassword = "password";
            isNormalUser = true;
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
          };
        };
      };
    };
}
