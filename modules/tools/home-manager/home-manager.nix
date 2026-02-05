{ inputs, ... }:
{
  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          verbose = true;
          useUserPackages = true;
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          backupCommand = "rm";
          overwriteBackup = true;
        };
      }
    ];
  };
}
