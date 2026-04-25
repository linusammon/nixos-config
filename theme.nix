{ lib, ... }:
let
  theme = {
    # vesper
    # base00 = "#101010";
    # base01 = "#232323";
    # base02 = "#222222";
    # base03 = "#333333";
    # base04 = "#999999";
    # base05 = "#b7b7b7";
    # base06 = "#c1c1c1";
    # base07 = "#d5d5d5";
    # base08 = "#de6e6e";
    # base09 = "#dab083";
    # base0A = "#ffc799";
    # base0B = "#5f8787";
    # base0C = "#60a592";
    # base0D = "#8eaaaa";
    # base0E = "#d69094";
    # base0F = "#876c4f";

    # tomorrow-night
    base00 = "#1d1f21";
    base01 = "#282a2e";
    base02 = "#373b41";
    base03 = "#969896";
    base04 = "#b4b7b4";
    base05 = "#c5c8c6";
    base06 = "#e0e0e0";
    base07 = "#ffffff";
    base08 = "#cc6666";
    base09 = "#de935f";
    base0A = "#f0c674";
    base0B = "#b5bd68";
    base0C = "#8abeb7";
    base0D = "#81a2be";
    base0E = "#b294bb";
    base0F = "#a3685a";
  };

  themeNoHash = builtins.mapAttrs (_: lib.removePrefix "#") theme;
in
{
  flake = {
    inherit theme themeNoHash;
  };
}
