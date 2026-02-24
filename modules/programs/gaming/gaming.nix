{ inputs, ... }:
{
  flake.modules.nixos.gaming = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;

      packages = [
        "com.heroicgameslauncher.hgl"
        "com.modrinth.ModrinthApp"
        "org.vinegarhq.Sober"
      ];
    };

    programs = {
      steam.enable = true;
      gamescope.enable = true;
    };
  };
}
