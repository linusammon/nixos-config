{
  lib,
  pkgs,
  hostName,
}:
{
  auto_install_extensions = {
    nix = true;
  };

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
            expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.${hostName}.options";
          };
        };
      };
    };
  };
}
