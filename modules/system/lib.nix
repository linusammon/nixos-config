{
  inputs,
  lib,
  ...
}:
{
  lib.perSystem =
    f:
    lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (
      system:
      f (
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      )
    );

  lib.mkNixos =
    hostName:
    {
      hostPlatform ? "x86_64-linux",
      timeZone ? "Europe/Zurich",
      keyMap ? "de",
      user ? "linus",
      modules ? [ ],
    }:
    {
      ${hostName} = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          args = {
            inherit
              hostName
              hostPlatform
              timeZone
              keyMap
              user
              ;
          };
        };
        modules = [ ./_custom.nix ] ++ modules;
      };
    };

  lib.collect =
    subtree:
    {
      exclude ? [ ],
    }:
    {
      imports = lib.attrValues (removeAttrs subtree exclude);
    };
}
