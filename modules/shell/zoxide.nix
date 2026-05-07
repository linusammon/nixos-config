{
  flake.modules.nixos.common =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = [ pkgs.zoxide ];

      programs =
        let
          exe = lib.getExe pkgs.zoxide;
        in
        {
          fish.interactiveShellInit = ''
            ${exe} init fish --cmd cd | source
          '';
        };
    };
}
