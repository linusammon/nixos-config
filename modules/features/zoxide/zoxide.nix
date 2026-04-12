{
  flake.modules.nixos.zoxide =
    { pkgs, lib, ... }:
    {
      environment = {
        systemPackages = [ pkgs.zoxide ];
      };

      programs =
        let
          exe = lib.getExe pkgs.zoxide;
        in
        {
          fish = {
            interactiveShellInit = ''
              ${exe} init fish --cmd cd | source
            '';
          };
        };
    };
}
