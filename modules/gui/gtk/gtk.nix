{ self, ... }:
{
  flake.modules.nixos.wm =
    {
      pkgs,
      lib,
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

      css = import ./_theme.nix { inherit self; };
    in
    {
      hj.xdg.config.files = {
        "gtk-3.0/settings.ini".text = settings;
        "gtk-4.0/settings.ini".text = settings;
        "gtk-3.0/gtk.css".text = css;
        "gtk-4.0/gtk.css".text = css;
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

      environment.systemPackages = [
        icon-theme-package
      ];
    };
}
