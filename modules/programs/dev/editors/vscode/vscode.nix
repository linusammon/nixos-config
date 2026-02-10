{
  flake.modules.homeManager.vscode =
    { pkgs, ... }:
    {
      programs.vscode.enable = true;

      home.packages = with pkgs; [
        nixd
      ];
    };
}
