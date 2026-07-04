{
  modules.nixos.gui.gtk =
    {
      pkgs,
      lib,
      theme,
      ...
    }:
    let
      icon-theme-name = "MoreWaita";
      icon-theme-package = pkgs.morewaita-icon-theme;

      settings = ''
        [Settings]
        gtk-icon-theme-name = ${icon-theme-name}
        gtk-application-prefer-dark-theme = true
      '';

      css = import ./_theme.nix theme;
    in
    {
      custom.symlinks.files = {
        "gtk-3.0/settings.ini" = settings;
        "gtk-4.0/settings.ini" = settings;
        "gtk-3.0/gtk.css" = css;
        "gtk-4.0/gtk.css" = css;
      };

      programs = {
        dconf = {
          enable = lib.mkDefault true;
          profiles = {
            user = {
              databases = [
                {
                  lockAll = false;
                  settings = {
                    "org/gnome/desktop/interface" = {
                      icon-theme = icon-theme-name;
                      color-scheme = "prefer-dark";
                    };
                  };
                }
              ];
            };
          };
        };
      };

      environment.systemPackages = [ icon-theme-package ];
    };
}
