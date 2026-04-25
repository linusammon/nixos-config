{ self, ... }:
{
  flake.modules.nixos.programs_qutebrowser =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.qutebrowser
      ];

      hj.xdg.config.files."qutebrowser/config.py".text = import ./_config.nix { inherit self; };

      custom.persist.user.directories = [
        ".config/qutebrowser"
        ".cache/qutebrowser"
        ".local/share/qutebrowser"
      ];
    };
}
