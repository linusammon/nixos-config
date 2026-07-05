{ pkgs, lib }: {
  auto_install_extensions = {
    java = true;
    kotlin = true;
    groovy = true;
  };

  languages = {
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
  };

  lsp = {
    jdtls = {
      binary = {
        path = lib.getExe pkgs.jdt-language-server;
      };
      settings = {
        java_home = pkgs.temurin-bin-25;
        lombok_support = true;
      };
    };

    groovy-language-server = {
      binary.path = lib.getExe' pkgs.groovy-language-server "groovy-language-server";
    };

    kotlin-language-server = {
      binary.path = lib.getExe pkgs.kotlin-language-server;
    };
  };
}
