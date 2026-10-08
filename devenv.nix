{ pkgs, ... }:
{
  packages = with pkgs; [
    nixd
    nil
    nixfmt
    jq
    efm-langserver
    deadnix
    statix
    vulnix
  ];
}
