{
  flake.modules.nixos.fish = {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
      '';
    };

    environment.persistence."/persistent".users."linus".directories = [
      ".local/share/fish"
    ];
  };
}
