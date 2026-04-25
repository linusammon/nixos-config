{ inputs, ... }:
{
  flake.modules.nixos.programs_discord = {
    imports = [ inputs.nixcord.nixosModules.nixcord ];

    programs.nixcord = {
      enable = true;
      user = "linus";

      discord = {
        vencord.enable = false;
        equicord.enable = true;
      };
    };

    custom.persist.user.directories = [
      ".config/discord"
      ".config/Equicord"
    ];
  };
}
