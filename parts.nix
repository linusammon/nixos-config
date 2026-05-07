{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  config = {
    systems = [ "x86_64-linux" ];
  };
}
