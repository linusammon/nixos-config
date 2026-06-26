{ inputs, ... }: {
  modules.nixos.cli.tack =
    {
      config,
      pkgs,
      ...
    }:
    let
      tack = inputs.nix-wrapper-modules.lib.wrapPackage {
        inherit pkgs;
        package = inputs.tack.packages.${pkgs.stdenv.hostPlatform.system}.tack;
        runShell = [
          ''
            GITHUB_TOKEN=$(cat "${config.sops.secrets.github-token.path}")
            export GITHUB_TOKEN
          ''
        ];
      };
    in
    {
      environment.systemPackages = [ tack ];
    };
}
