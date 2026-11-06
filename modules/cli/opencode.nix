{
  modules.nixos.cli.opencode =
    { pkgs, ... }:
    let
      opencode = pkgs.opencode.overrideAttrs (old: {
        node_modules = old.node_modules.overrideAttrs (_: {
          outputHash = "sha256-prx9dX7kUvs/E3zopkaPk5LXh3xJAy5sZeum/W8L7cA=";
        });
      });
    in
    {
      environment.systemPackages = [ opencode ];

      custom.persist.user.directories = [ ".local/share/opencode" ];
    };
}
