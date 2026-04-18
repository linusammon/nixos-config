{
  flake.modules.nixos.thunderbird = {
    programs.thunderbird.enable = true;

    persistence.user.directories = [
      ".thunderbird"
    ];
  };
}
