{ inputs, ... }:
{
  modules.nixos.system.secrets =
    { args, ... }:
    {
      imports = [ inputs.nix-secrets.nixosModules.default ];

      security.nix-secrets = {
        enable = true;
        storage = ../../secrets;
        identityPaths = [ "/etc/age/${args.hostName}-key.txt" ];

        recipientAliases = {
          riptide = "age1zlf4djfa6qrhdw6a3q2tvxe4e7xm0f3kkvd4n53uljzcu3f235asckupgt";
          zenbook = "age1pq3fxnv0uur0g89gdluuh53t4s6tqnssthwgtl3prts42q89lcps66k7r5";
          wsl = "age12tmekla2d5ha8286qk5d3hp0pxfcy8g4ynat3t6uz3punvu7z4ps95qtu9";
        };

        secrets = {
          "${args.hostName}/password" = {
            neededForUsers = true;
            recipients = [ args.hostName ];
          };

          "shared/ssh-key" = {
            owner = args.user;
            recipients = [
              "riptide"
              "zenbook"
              "wsl"
            ];
          };
        };
      };
    };
}
