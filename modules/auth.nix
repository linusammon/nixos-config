{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      services.displayManager = {
        autoLogin = {
          enable = true;
          inherit user;
        };

        ly = {
          enable = true;
          x11Support = false;
        };
      };

      services.gnome.gnome-keyring.enable = true;
      security.pam.services.login.enableGnomeKeyring = true;

      security.polkit.enable = true;

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };

      custom.persist.user.directories = [
        ".local/share/keyrings"
        ".ssh"
        ".gnupg"
      ];
    };
}
