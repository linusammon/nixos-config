{ inputs, ... }: {
  modules.nixos.cli.gh =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      gh = inputs.nix-wrapper-modules.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.gh;
        env = {
          GH_CONFIG_DIR = pkgs.writeTextDir "/config.yml" (lib.strings.toJSON { version = 1; });
          GITHUB_TOKEN = "$(cat ${config.sops.secrets.github-token.path})";
        };
      };
    in
    {
      environment.systemPackages = [ gh ];
    };
}
