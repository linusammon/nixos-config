{
  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableInteractive = true;

      settings = {
        line_break.disabled = true;
      };
    };

    home.persistence."/persist".files = [
      ".config/starship.toml"
    ];
  };
}
