{
  modules.nixos.system.locale = { args, ... }: {
    console = { inherit (args) keyMap; };

    time = { inherit (args) timeZone; };

    i18n = {
      defaultLocale = "en_GB.UTF-8";
      extraLocales = [ "de_CH.UTF-8/UTF-8" ];
      extraLocaleSettings = {
        LC_ADDRESS = "de_CH.UTF-8";
        LC_IDENTIFICATION = "de_CH.UTF-8";
        LC_MEASUREMENT = "de_CH.UTF-8";
        LC_MONETARY = "de_CH.UTF-8";
        LC_NAME = "de_CH.UTF-8";
        LC_NUMERIC = "de_CH.UTF-8";
        LC_PAPER = "de_CH.UTF-8";
        LC_TELEPHONE = "de_CH.UTF-8";
        LC_TIME = "en_GB.UTF-8";
      };
    };
  };
}
