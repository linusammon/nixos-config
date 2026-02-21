{ inputs, ... }:
{
  flake.modules.homeManager.webapps = {
    imports = [
      inputs.firefox-webapps.homeModules.default
    ];

    programs.firefox-webapps = {
      enable = true;

      webApps = [
        {
          name = "M365 Copilot";
          url = "https://m365.cloud.microsoft/apps/?auth=1";
          icon = ./icons/ms-365.png;
          comment = "Microsoft office suit";
          categories = [ "Office" ];
        }
      ];
    };
  };
}
