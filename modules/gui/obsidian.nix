{
  flake.modules.nixos.programs_obsidian =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.obsidian
      ];

      custom.persist.user.directories = [
        ".config/obsidian"
      ];
    };
}
