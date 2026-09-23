{
  self,
  inputs,
  lib,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    helix = inputs.nix-wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;
      settings = import ./_settings.nix;
      languages = import ./_languages.nix { inherit pkgs lib; };
      runtimePkgs = with pkgs; [
        jq
        nixfmt
        nil
        nixd
        efm-langserver
        deadnix
        statix
        nodejs
        typescript-language-server
        tailwindcss-language-server
        emmet-language-server
        vscode-langservers-extracted
        marksman
        taplo
        yaml-language-server
      ];
    };
  });

  modules.nixos.cli.helix =
    { pkgs, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.helix;
      exe = lib.getExe pkg;
    in
    {
      environment.systemPackages = [ pkg ];

      environment.sessionVariables = {
        EDITOR = exe;
        VISUAL = exe;
      };
    };
}
