{
  flake.modules.homeManager.eza = {
    programs.eza.enable = true;

    programs.fish.shellAliases = {
      lt = "eza -T";
    };
  };
}
