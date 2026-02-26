{
  flake.modules.nixos.tuned = {
    services.tuned.enable = true;

    xdg.desktopEntries = {
      "tuned-gui" = {
        name = "Tuned GUI";
        noDisplay = true;
      };
    };
  };
}
