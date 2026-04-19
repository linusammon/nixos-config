{ self, ... }:
{
  flake.modules.nixos.qutebrowser =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.qutebrowser
      ];

      hj.xdg.config.files."qutebrowser/config.py".text = import ./_config.nix { inherit self; };

      persistence.user.directories = [
        ".config/qutebrowser"
        ".cache/qutebrowser"
        ".local/share/qutebrowser"
      ];
    };
}
