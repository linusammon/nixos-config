{ inputs, self, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
        self.modules.homeManager.cliphist
      ];

      home.packages = with pkgs; [ wtype ];

      programs.noctalia-shell.enable = true;

      home.persistence."/persistent".directories = [
        ".config/noctalia/plugins"
      ];
    };
}
