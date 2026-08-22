{ self, inputs, ... }:
{
  packages = self.lib.perSystem (pkgs: {
    qutebrowser = inputs.nix-wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.qutebrowser;
      constructFiles.config = {
        relPath = "qutebrowser/config.py";
        content = import ./_config.nix { inherit (self.theme) colors; };
      };
      flags = {
        "--config-py" = "${placeholder "out"}/qutebrowser/config.py";
        "--qt-flag" = "disable-gpu-compositing";
      };
    };
  });

  modules.nixos.gui.qutebrowser =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.qutebrowser;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Shift+B".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".config/qutebrowser"
        ".cache/qutebrowser"
        ".local/share/qutebrowser"
      ];
    };
}
