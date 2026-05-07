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

      config = {
        plugins = {
          messageLoggerEnhanced.enable = true;
          voiceChannelLog.enable = true;
          showHiddenChannels.enable = true;
          showHiddenThings.enable = true;
          fileUpload.enable = true;
          silentTyping.enable = true;
        };
      };
    };

    custom.keybinds."Mod+Shift+D".spawn = "discord";

    custom.persist.user.directories = [
      ".config/discord"
      ".config/Equicord"
    ];
  };
}
