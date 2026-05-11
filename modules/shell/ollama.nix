{
  flake.modules.nixos.common =
    { pkgs, ... }:
    {
      services = {
        ollama = {
          enable = true;
          package = pkgs.ollama-rocm;
          rocmOverrideGfx = "11.0.0";
        };
      };

      custom.persist.user.directories = [
        ".ollama"
      ];
    };
}
