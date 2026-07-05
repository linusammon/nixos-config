{ pkgs, lib }: {
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
          command = lib.getExe' pkgs.bash "bash";
          arguments = [
            "-c"
            "cat > \"$0\"; ${lib.getExe pkgs.nix} fmt \"$0\"; cat \"$0\""
            "{buffer_path}"
          ];
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
            expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options";
          };
        };
      };
    };
  };
}
