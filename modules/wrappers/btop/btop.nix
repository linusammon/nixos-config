{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      conf = pkgs.writeText "btop.conf" ''
        theme_background = false
        rounded_corners = false
        cpu_single_graph = true
        clock_format = ""
      '';
    in
    {
      packages.btop = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.btop;
        flags = {
          "--config" = conf;
        };
      };
    };
}
