{ inputs, lib, ... }:
{
  modules.nixos.secrets =
    { args, config, ... }:
    {
      imports = [ inputs.nix-secrets.nixosModules.default ];

      security.nix-secrets = {
        enable = true;
        storage = ../../secrets;
        identityPaths = [ "/etc/age/${args.scope}-key.txt" ];

        recipientAliases = {
          private = "age1zlf4djfa6qrhdw6a3q2tvxe4e7xm0f3kkvd4n53uljzcu3f235asckupgt";
          school = "age1xdplvqk9ngr73hf3936e504mv4qujdd4268h6xmx4eknw5x3kcpq88cq0r";
          work = "age1vlvjgvjtzrldkg2j99x08jf9yqqq9yrcu27yxrhctxhvn8fvj5nqnjncrz";
        };

        secrets =
          {
            "${args.scope}/password".neededForUsers = true;
            "${args.scope}/gpg-private-key".owner = args.user;
            "${args.scope}/git-config".owner = args.user;
          }
          |> lib.mapAttrs (_: v: v // { recipients = [ args.scope ]; });
      };

      programs.git.config."include".path =
        config.security.nix-secrets.secrets."${args.scope}/git-config".path;
    };
}
