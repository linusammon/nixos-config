{
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      users.users.linus = {
        isNormalUser = true;
        initialPassword = "changeme";
        home = "/home/linus";
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        shell = pkgs.fish; # TODO: Don't hardcode this.
      };
    };
}
