{ pkgs, lib, ... }:
let
  prettier = parser: {
    command = "npx";
    args = [
      "--no-install"
      "prettier"
      "--parser"
      parser
    ];
  };

  eslintLanguageIds = [
    "typescript"
    "typescriptreact"
    "javascript"
    "javascriptreact"
  ];
in
{
  language = map (entry: { auto-format = true; } // entry) [
    {
      name = "nix";
      formatter.command = "nixfmt";
      language-servers = [
        "nil"
        "nixd"
        "efm"
        "devenv-lsp"
      ];
    }
    {
      name = "python";
      formatter = {
        command = "ruff";
        args = [
          "format"
          "--stdin-filename"
          "%{buffer_name}"
          "-"
        ];
      };
      language-servers = [
        "pyright"
        "ruff"
      ];
      debugger = {
        name = "debugpy";
        transport = "stdio";
        command = "python";
        args = [
          "-m"
          "debugpy.adapter"
        ];
        templates = [
          {
            name = "launch";
            request = "launch";
            completion = [
              {
                name = "entrypoint";
                completion = "filename";
                default = ".";
              }
            ];
            args = {
              mode = "debug";
              program = "{0}";
            };
          }
        ];
      };
    }
    {
      name = "typescript";
      formatter = prettier "typescript";
      language-servers = [
        "typescript-language-server"
        "tailwindcss-language-server"
        "efm"
      ];
    }
    {
      name = "tsx";
      formatter = prettier "typescript";
      language-servers = [
        "typescript-language-server"
        "tailwindcss-language-server"
        "emmet-language-server"
        "efm"
      ];
    }
    {
      name = "javascript";
      formatter = prettier "babel";
      language-servers = [
        "typescript-language-server"
        "tailwindcss-language-server"
        "efm"
      ];
    }
    {
      name = "jsx";
      formatter = prettier "babel";
      language-servers = [
        "typescript-language-server"
        "tailwindcss-language-server"
        "emmet-language-server"
        "efm"
      ];
    }
    {
      name = "css";
      formatter = prettier "css";
      language-servers = [
        "vscode-css-language-server"
        "tailwindcss-language-server"
        "emmet-language-server"
      ];
    }
    {
      name = "scss";
      formatter = prettier "scss";
      language-servers = [
        "vscode-css-language-server"
        "tailwindcss-language-server"
        "emmet-language-server"
      ];
    }
    {
      name = "html";
      formatter = prettier "html";
      language-servers = [
        "vscode-html-language-server"
        "tailwindcss-language-server"
        "emmet-language-server"
      ];
    }
    {
      name = "markdown";
      formatter = prettier "markdown";
      language-servers = [ "marksman" ];
    }
    {
      name = "toml";
      language-servers = [ "taplo" ];
    }
    {
      name = "yaml";
      language-servers = [ "yaml-language-server" ];
    }
    {
      name = "rust";
      auto-format = true;
      language-servers = [ "rust-analyzer" ];
    }
    {
      name = "scheme";
      formatter = {
        command = "schemat";
        args = [ ];
      };
      language-servers = [ "steel-language-server" ];
    }
  ];

  language-server = {
    steel-language-server = {
      command = "steel-language-server";
      args = [ ];
    };
    devenv-lsp = {
      command = "devenv";
      args = [ "lsp" ];
    };
    ruff = {
      command = "ruff";
      args = [ "server" ];
    };
    pyright = {
      command = "pyright-langserver";
      args = [ "--stdio" ];
      config.python.analysis = {
        typeCheckingMode = "standard";
        autoSearchPaths = true;
        useLibraryCodeForTypes = true;
        autoImportCompletions = true;
        completeFunctionParens = true;
        indexing = true;
        diagnosticMode = "openFilesOnly";
        inlayHints = {
          callArgumentNames = true;
          functionReturnTypes = true;
          variableTypes = true;
          pytestParameters = true;
        };
      };
    };
    tailwindcss-language-server = {
      command = "tailwindcss-language-server";
      args = [ "--stdio" ];
    };
    emmet-language-server = {
      command = "emmet-language-server";
      args = [ "--stdio" ];
    };
    typescript-language-server.config.preferences = {
      includeInlayParameterNameHints = "all";
      includeInlayFunctionParameterTypeHints = true;
      includeInlayVariableTypeHints = true;
      includeInlayPropertyDeclarationTypeHints = true;
      includeInlayFunctionLikeReturnTypeHints = true;
      includeInlayEnumMemberValueHints = true;
    };
    vscode-css-language-server.config = {
      css.lint.unknownAtRules = "ignore";
      scss.lint.unknownAtRules = "ignore";
    };
    efm = {
      command = "efm-langserver";
      args = [
        "-c"
        "${pkgs.writeText "efm-config.json" (
          builtins.toJSON {
            version = 2;
            root-markers = [ ".git" ];
            languages = {
              nix = [
                {
                  lint-command = "statix check -s -o errfmt";
                  lint-stdin = true;
                  lint-after-open = true;
                  lint-on-save = true;
                  lint-formats = [ "%f>%l:%c:%t:%n:%m" ];
                  lint-source = "statix";
                }
                {
                  lint-command = ''deadnix --output-format json ''${INPUT} | jq -r '.results[] | "\(.line):\(.column): \(.message)"' '';
                  lint-stdin = false;
                  lint-after-open = true;
                  lint-on-save = true;
                  lint-ignore-exit-code = true;
                  lint-formats = [ "%l:%c: %m" ];
                  lint-source = "deadnix";
                }
              ];
            }
            // lib.genAttrs eslintLanguageIds (_: [
              {
                lint-command = ''npx --no-install eslint --no-color --format json --stdin --stdin-filename ''${INPUT} | jq -r '.[0].messages[]? | "\(.line):\(.column): \(.message) [\(.ruleId // "")]"' '';
                lint-stdin = true;
                lint-after-open = true;
                lint-on-save = true;
                lint-ignore-exit-code = true;
                lint-formats = [ "%l:%c: %m" ];
                lint-source = "eslint";
              }
            ]);
          }
        )}"
      ];
    };
    rust-analyzer.config = {
      check.command = "clippy";
      cargo.features = "all";
      procMacro.enable = true;
      lens.enable = false;
    };
  };
}
