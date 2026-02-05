{
  flake.modules.homeManager.firefox = {
    programs.firefox.enable = true;

    home.file.".config/mozilla/firefox/profiles.ini".source = ./files/profiles.ini;
    home.file.".config/mozilla/firefox/default/prefs.js".source = ./files/default/prefs.js;
    home.file.".config/mozilla/firefox/default/search.json.mozlz4".source =
      ./files/default/search.json.mozlz4;
    home.file.".config/mozilla/firefox/default/extensions.json".source =
      ./files/default/extensions.json;
    home.file.".config/mozilla/firefox/default/extensions".source = ./files/default/extensions;
  };
}
