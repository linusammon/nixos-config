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

      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;
      };

      programs.niri.settings.binds = {
        # Toggle app launcher
        "Mod+Space".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];

        # Toggle session menu
        "Mod+Escape".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "sessionMenu"
          "toggle"
        ];
      };

      home.persistence."/persistent".directories = [
        ".config/noctalia/plugins"
      ];
    };
}
