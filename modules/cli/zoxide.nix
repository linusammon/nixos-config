{
  modules.nixos.cli.zoxide = { pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.zoxide ];

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.zoxide} init fish --cmd cd | source
    '';

    custom.persist.user.directories = [ ".local/share/zoxide" ];
  };
}
