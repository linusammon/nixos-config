{ inputs, self, ... }:
{
  flake.modules.nixos.programs_discord =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      imports = [ inputs.nixcord.nixosModules.nixcord ];

      programs.nixcord = {
        enable = true;
        inherit user;

        discord = {
          branch = "ptb";
          vencord.enable = false;
          equicord.enable = true;
        };

        quickCss = import ./_theme.nix { inherit self; };

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

      custom.keybinds."Mod+Shift+D".spawn = "discord";

      custom.persist.user.directories = [
        ".config/discordptb"
        ".config/Equicord"
      ];
    };
}
