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
        env.GITHUB_TOKEN = "$(cat ${config.sops.secrets.github-token.path})";
      };
    in
    {
      environment.systemPackages = [ tack ];
    };
}
