{ inputs, ... }:
{
  flake.modules.nixos.nixcord = {
    imports = [ inputs.nixcord.nixosModules.nixcord ];

    programs.nixcord = {
      enable = true;
      user = "linus";

      discord = {
        vencord.enable = false;
        equicord.enable = true;
      };
    };

    persistence.user.directories = [
      ".config/discord"
      ".config/Equicord"
    ];
  };
}
