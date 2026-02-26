{
  flake.modules.homeManager.vscode =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;

        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
          ];

          userSettings = {
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";
            "terminal.integrated.tabs.location" = "left";
            "workbench.tree.renderIndentGuides" = "always";
            "workbench.tree.indent" = 16;
            "explorer.compactFolders" = false;
            "chat.viewSessions.orientation" = "stacked";
            "git.autofetch" = true;
            "diffEditor.ignoreTrimWhitespace" = false;
            "chat.disableAIFeatures" = true;
          };
        };
      };

      home.persistence."/persist".directories = [
        ".config/Code"
      ];
    };
}
