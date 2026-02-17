{
  flake.modules.homeManager.nix =
    { pkgs, ... }:
    {
      programs.helix.languages = {
        language-server.nix-lsp = {
          command = "${pkgs.nixd}/bin/nixd";
        };

        language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
            language-servers = [ "nix-lsp" ];
          }
        ];
      };
    };
}
