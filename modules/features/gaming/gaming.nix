{
  flake.modules.nixos.gaming = {
    programs = {
      steam.enable = true;
      gamescope.enable = true;
    };

    environment.persistence."/persistent".directories = [
      ".local/share/Steam"
    ];
  };
}
