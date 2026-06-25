{
  modules.nixos.gui.thunderbird = _: {
    programs.thunderbird.enable = true;

    custom.persist.user.directories = [
      ".thunderbird"
    ];
  };
}
