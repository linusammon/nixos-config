{
  flake.modules.homeManager.thunderbird = {
    programs.thunderbird = {
      enable = true;
      profiles.default = {
        isDefault = true;
      };
    };

    home.persistence."/persist".directories = [
      ".thunderbird"
    ];
  };
}
