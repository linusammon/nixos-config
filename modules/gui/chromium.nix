{
  flake.modules.nixos.programs_chromium =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.ungoogled-chromium
      ];

      custom.persist.user.directories = [
        ".config/chromium"
        ".cache/chromium"
      ];
    };
}
