{ inputs, ... }:
{
  imports = [ inputs.flake-file.flakeModules.dendritic ];

  systems = [
    "x86_64-linux"
  ];
}
