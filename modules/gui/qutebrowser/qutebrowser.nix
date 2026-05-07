{ self, ... }:
{
  flake.modules.nixos.programs_qutebrowser =
    { pkgs, lib, ... }:
    let
      pkg = pkgs.qutebrowser;
    in
    {
      environment.systemPackages = [ pkg ];

      hj.xdg.config.files."qutebrowser/config.py".text = import ./_config.nix { inherit self; };

      custom.keybinds."Mod+Shift+B".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".config/qutebrowser"
        ".cache/qutebrowser"
        ".local/share/qutebrowser"
      ];
    };
}
