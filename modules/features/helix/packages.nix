{
  flake.modules.homeManager.helix =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # Nix
        nixd

        # Markdown
        markdown-oxide
      ];
    };
}
