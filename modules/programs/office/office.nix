{
  flake.modules.homeManager.office = {
    programs.firefox-webapps.webApps = [
      {
        name = "M365 Copilot";
        url = "https://m365.cloud.microsoft/apps/?auth=1";
        icon = ./files/ms-365.png;
        comment = "Microsoft office suit";
        categories = [ "Office" ];
      }
    ];
  };
}
