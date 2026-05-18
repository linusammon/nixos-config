{
  flake.modules.nixos.programs_thunderbird = {
    programs.thunderbird.enable = true;

    custom.persist.user.directories = [
      ".thunderbird"
    ];
  };
}
