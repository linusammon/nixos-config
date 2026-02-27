{
  flake.modules.homeManager.ssh = {
    home.persistence."/persistent".directories = [
      ".ssh"
    ];
  };
}
