{
  modules.nixos.cli.devenv = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.devenv ];
  };
}
