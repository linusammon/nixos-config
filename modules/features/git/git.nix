{
  flake.modules.nixos.git = {
    programs.git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
        user = {
          name = "Linus Ammon";
          email = "235536459+linusammon@users.noreply.github.com";
        };
      };
    };
  };
}
