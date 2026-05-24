{ ... }:
{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) host;
    in
    {
      networking.hostName = host;

      console.keyMap = "de";

      time.timeZone = "Europe/Zurich";

      system.stateVersion = "26.05";
    };
}
