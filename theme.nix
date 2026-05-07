let
  theme = {
    base00 = "#151515";
    base01 = "#202020";
    base02 = "#303030";
    base03 = "#505050";
    base04 = "#b0b0b0";
    base05 = "#d0d0d0";
    base06 = "#e0e0e0";
    base07 = "#f5f5f5";
    base08 = "#fb9fb1";
    base09 = "#eda987";
    base0A = "#ddb26f";
    base0B = "#acc267";
    base0C = "#12cfc0";
    base0D = "#6fc2ef";
    base0E = "#e1a3ee";
    base0F = "#deaf8f";
  };

  fonts = {
    sans = "Roboto";
    serif = "Roboto Serif";
    mono = "Roboto Mono";
    size = 12;
    packages =
      pkgs: with pkgs; [
        roboto
        roboto-serif
        roboto-mono
      ];
  };

  cursor = {
    theme = "Bibata-Modern-Ice";
    size = 22;
    package = pkgs: pkgs.bibata-cursors;
  };
in
{
  flake = {
    inherit theme fonts cursor;
  };
}
