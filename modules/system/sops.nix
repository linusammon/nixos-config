{ inputs, ... }: {
  modules.nixos.system.sops = _: {
    imports = [ inputs.sops-nix.nixosModules.sops ];

    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      age.keyFile = "/etc/age/key.txt";

      secrets.user-password.neededForUsers = true;
    };
  };
}
