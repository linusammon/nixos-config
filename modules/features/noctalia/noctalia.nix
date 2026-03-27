{ inputs, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia-shell.enable = true;

      services.cliphist.enable = true;

      home.packages = with pkgs; [ wtype ];

      home.persistence."/persistent".directories = [
        ".config/noctalia/plugins"
      ];
    };
}
