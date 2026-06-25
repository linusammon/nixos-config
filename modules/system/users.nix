{
  modules.nixos.system.users = { user, ... }: {
    users.users = {
      root.initialPassword = "password";

      ${user} = {
        initialPassword = "password";
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };
  };
}
