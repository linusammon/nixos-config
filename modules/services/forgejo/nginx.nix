{
  modules.nixos.services.forgejo.nginx =
    { config, lib, ... }:
    let
      cfg = config.custom.services.forgejo.settings;
      isDomain = builtins.match ".*\\.[a-z]{2,}$" cfg.domain != null;
      vhostName = if isDomain then cfg.domain else "_";
      useTls = cfg.scheme == "https";
      listenPort = if useTls then 443 else 80;
    in
    {
      services.nginx = {
        enable = true;

        recommendedProxySettings = true;
        recommendedOptimisation = true;
        recommendedTlsSettings = useTls;

        virtualHosts."${vhostName}" = {
          addSSL = useTls;
          enableACME = useTls;

          listen = [
            {
              addr = "0.0.0.0";
              port = listenPort;
            }
          ];

          locations."/" = {
            proxyPass = "http://localhost:${toString cfg.port}";
            proxyWebsockets = true;

            extraConfig = ''
              client_max_body_size 512M;
            ''
            + lib.optionalString (!isDomain) ''
              proxy_redirect ${cfg.scheme}://${cfg.domain}/ /;
            '';
          };
        };
      };

      networking.firewall.allowedTCPPorts = [ listenPort ];
    };
}
