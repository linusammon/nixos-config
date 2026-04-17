{ self, inputs, ... }:
let
  name = "linus";
  home = "/home/${name}";
in
{
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        verbose = true;
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        overwriteBackup = true;

        users.${name} = {
          imports = with self.modules.homeManager; [
            {
              home = {
                username = name;
                homeDirectory = home;
                stateVersion = "26.05";
              };
            }
            # TODO: Migrate these to NixOS modules using nix-wrapper-modules and/or xdg.config.
            # TODO: Once migrated, they should be imported by profiles/types instead of here.
            # btop
            # eza
            firefox
            # fish
            # fzf
            # git
            # kitty
            nautilus
            # nh
            nixcord
            # noctalia
            media
            ssh
            # starship
            stylix
            thunderbird
            #zed
            xdg
            # zoxide
          ];
        };
      };

      users.users.${name} = {
        isNormalUser = true;
        initialPassword = "changeme";
        inherit home;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        shell = pkgs.fish; # TODO: Don't hardcode this.
      };
    };
}
