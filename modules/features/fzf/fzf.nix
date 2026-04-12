{
  flake.modules.nixos.fzf =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = [ pkgs.fzf ];

      programs =
        let
          exe = lib.getExe pkgs.fzf;
        in
        {
          fish = {
            interactiveShellInit = ''
              ${exe} --fish | source
            '';
          };
        };
    };
}
