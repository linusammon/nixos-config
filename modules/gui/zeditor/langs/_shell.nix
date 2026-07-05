{ pkgs, lib }: {
  languages = {
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
  };

  lsp = {
    bash-language-server = {
      binary = {
        path = lib.getExe pkgs.bash-language-server;
      };
    };

    shellcheck = {
      binary = {
        path = lib.getExe pkgs.shellcheck;
      };
    };
  };
}
