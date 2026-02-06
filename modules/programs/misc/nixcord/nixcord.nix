{ inputs, ... }:
{
  flake.modules.homeManager.nixcord = {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;

      discord.enable = true;
      discord.vencord.enable = false;
      discord.equicord.enable = true;
    };
  };
}
