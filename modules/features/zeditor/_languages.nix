{ lib, pkgs }:
{
  languages = {
    Nix = {
      language_servers = [
        "nixd"
        "nil"
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
    };

    nil = {
      binary = {
        path = lib.getExe pkgs.nil;
      };
    };
  };
}
