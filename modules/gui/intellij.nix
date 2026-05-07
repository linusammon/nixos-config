{
  flake.modules.nixos.programs_intellij =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.jetbrains.idea
      ];

      custom.persist.user.directories = [
        ".local/share/JetBrains"
        ".java/.userPrefs/JetBrains"
        ".config/JetBrains"
        ".cache/JetBrains"
      ];
    };
}
