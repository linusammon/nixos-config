{
  modules.nixos.cli.fzf = { pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.fzf ];

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fzf} --fish | source
    '';
  };
}
