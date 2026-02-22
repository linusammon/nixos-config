{ inputs, ... }:
{
  flake.modules.homeManager.webapps = {
    imports = [ inputs.firefox-webapps.homeModules.default ];

    programs.firefox-webapps.enable = true;
  };
}
