{
  flake.modules.nixos.gaming = {
    programs = {
      steam.enable = true;
      gamescope.enable = true;
    };

    home.persistence."/persist".directories = [
      ".share/local/Steam"
    ];
  };
}
