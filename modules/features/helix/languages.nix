{
  flake.modules.homeManager.helix = {
    programs.helix.languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nix fmt";
        }
      ];
    };
  };
}
