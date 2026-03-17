{ inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.niri.overlays.default ];

      programs.niri.enable = true;

      environment.systemPackages = with pkgs; [
        bibata-cursors
        xwayland-satellite
      ];

      home-manager.sharedModules = [
        {
          home.file.".config/niri/config.kdl".source = ./config.kdl;
        }
      ];
    };
}
