pkgs: lib: {
  auto_install_extensions = {
    nix = true;
    java = true;
    kotlin = true;
    groovy = true;
    toml = true;
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

    Java = {
      language_servers = [ "jdtls" ];
      formatter = {
        external = {
          command = lib.getExe' pkgs.bash "bash";
          arguments = [
            "-c"
            "${lib.getExe pkgs.google-java-format} - | sed '/^[[:space:]]*;$/d'"
          ];
        };
      };
    };

    Groovy = {
      language_servers = [ "groovy-language-server" ];
    };

    Kotlin = {
      language_servers = [ "kotlin-language-server" ];
      formatter = {
        external = {
          command = lib.getExe pkgs.ktlint;
          arguments = [
            "--format"
            "--stdin"
            "--stdin-path={buffer_path}"
            "--log-level=none"
          ];
        };
      };
    };

    "Shell Script" = {
      formatter = {
        external = {
          command = lib.getExe pkgs.shfmt;
          arguments = [
            "--filename"
            "{buffer_path}"
            "--indent"
            "2"
          ];
        };
      };
    };

    Bash = {
      language_servers = [
        "bash-language-server"
        "shellcheck"
      ];
      formatter = {
        external = {
          command = lib.getExe pkgs.shfmt;
        };
      };
    };

    Json = {
      language_servers = [
        "vscode-json-languageserver"
      ];
      formatter = {
        external = {
          command = lib.getExe pkgs.prettier;
          arguments = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };

    Yaml = {
      language_servers = [
        "yaml-language-server"
      ];
      formatter = {
        external = {
          command = lib.getExe pkgs.prettier;
          arguments = [
            "--stdin-filepath"
            "{buffer_path}"
          ];
        };
      };
    };
  };

  lsp = {
    nixd = {
      binary.path = lib.getExe pkgs.nixd;
      settings = {
        options = {
          nixos = {
            expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options";
          };
        };
      };
    };

    jdtls = {
      binary = {
        path = lib.getExe pkgs.jdt-language-server;
      };
      settings = {
        lombok_support = true;
      };
    };

    groovy-language-server = {
      binary.path = lib.getExe' pkgs.groovy-language-server "groovy-language-server";
    };

    kotlin-language-server = {
      binary.path = lib.getExe pkgs.kotlin-language-server;
    };

    bash-language-server = {
      binary.path = lib.getExe pkgs.bash-language-server;
    };

    shellcheck = {
      binary.path = lib.getExe pkgs.shellcheck;
    };

    vscode-json-languageserver = {
      binary.path = lib.getExe pkgs.vscode-json-languageserver;
    };

    yaml-language-server = {
      binary.path = lib.getExe pkgs.yaml-language-server;
    };
  };
}
