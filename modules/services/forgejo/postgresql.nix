{
  modules.nixos.services.forgejo.postgresql = _: {
    services.forgejo.database.type = "postgres";

    services.postgresql = {
      enable = true;

      ensureDatabases = [ "forgejo" ];

      ensureUsers = [
        {
          name = "forgejo";
          ensureDBOwnership = true;
        }
      ];
    };

    services.postgresqlBackup = {
      enable = true;
      databases = [ "forgejo" ];
    };
  };
}
