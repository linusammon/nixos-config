{ lib, pkgs }:
{
  languages = {
    Nix = {
      language_servers = [
        "nixd"
        "!nil"
      ];
      formatter = {
        external = {
          command = lib.getExe pkgs.nixfmt;
        };
      };
    };
  };

  lsp = {
    nixd = {
      binary = {
        path = lib.getExe pkgs.nixd;
      };
      settings = {
        options = {
          nixos = {
            expr = "(builtins.getFlake \"github:linusammon/nixos-config\").nixosConfigurations.desktop.options";
          };
        };
      };
    };
  };
}
