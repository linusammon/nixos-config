{
  modules.nixos.services.forgejo.forgejo =
    { config, lib, ... }:
    let
      cfg = config.custom.services.forgejo.settings;
    in
    {
      options.custom.services.forgejo.settings = with lib.types; {
        port = lib.mkOption {
          type = port;
          default = 3000;
        };

        scheme = lib.mkOption {
          type = enum [
            "http"
            "https"
          ];
          default = "http";
        };

        domain = lib.mkOption {
          type = str;
          default = config.networking.fqdnOrHostName;
        };
      };

      config.services.forgejo = {
        enable = true;

        settings = {
          server = {
            DOMAIN = cfg.domain;
            ROOT_URL = "${cfg.scheme}://${cfg.domain}/";
            HTTP_PORT = cfg.port;
            PROTOCOL = "http";
          };

          service.DISABLE_REGISTRATION = true;
        };
      };
    };
}
