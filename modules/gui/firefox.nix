{
  flake.modules.nixos.programs_firefox = {
    programs.firefox.enable = true;

    custom.persist.user.directories = [
      ".config/mozilla/firefox"
      ".cache/mozilla/firefox"
    ];
  };
}
