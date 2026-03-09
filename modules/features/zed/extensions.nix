{
  flake.modules.homeManager.zed =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        extensions = [
          "colored-zed-icons-theme"
          "nix"
          "java"
        ];

        extraPackages = with pkgs; [
          # Nix
          nil
          nixd

          # Java
          javaPackages.compiler.temurin-bin.jdk-25 # jdtls needs a java version in PATH
        ];
      };
    };
}
