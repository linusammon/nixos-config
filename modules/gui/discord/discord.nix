{ inputs, ... }:
{
  modules.nixos.gui.discord = { theme, args, ... }: {
    imports = [ inputs.nixcord.nixosModules.nixcord ];

    programs.nixcord = {
      enable = true;
      inherit (args) user;

      discord = {
        branch = "ptb";
        vencord.enable = false;
        equicord.enable = true;
      };

      quickCss = import ./_theme.nix { inherit (theme) colors fonts; };

      config = {
        useQuickCss = true;

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

    custom.keybinds."Mod+Shift+D".spawn = "discordptb";

    custom.persist.user.directories = [
      ".config/discordptb"
      ".config/Equicord"
    ];
  };
}
