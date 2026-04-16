{ lib, ... }:
let
  theme = {
    base00 = "#242424";
    base01 = "#3c3836";
    base02 = "#504945";
    base03 = "#665c54";
    base04 = "#bdae93";
    base05 = "#d5c4a1";
    base06 = "#ebdbb2";
    base07 = "#fbf1c7";
    base08 = "#fb4934";
    base09 = "#fe8019";
    base0A = "#fabd2f";
    base0B = "#b8bb26";
    base0C = "#8ec07c";
    base0D = "#7daea3";
    base0E = "#e089a1";
    base0F = "#f28534";
  };

  themeNoHash = builtins.mapAttrs (_: lib.removePrefix "#") theme;
in
{
  flake = {
    inherit theme themeNoHash;
  };
}
