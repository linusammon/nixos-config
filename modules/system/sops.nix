{ inputs, ... }: {
  modules.nixos.system.sops = { args, ... }: {
    imports = [ inputs.sops-nix.nixosModules.sops ];

    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      age.keyFile = "/etc/age/key.txt";

      secrets = {
        user-password.neededForUsers = true;
        github-token.owner = args.user;
        gpg-private-key.owner = args.user;
      };
    };
  };
}
