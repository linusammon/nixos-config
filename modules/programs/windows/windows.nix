{ self, ... }:
{
  flake.modules.homeManager.windows =
    { config, ... }:
    {
      imports = [
        self.modules.homeManager.webapps
      ];

      programs.firefox-webapps.webApps = [
        {
          name = "Windows";
          url = "localhost:8006";
          icon = ./files/windows.png;
          comment = "Windows VM via Docker";
          preLaunch = ''
            cd ${config.home.homeDirectory}/.windows/
            docker compose up --detach
          '';
          postExit = ''
            cd ${config.home.homeDirectory}/.windows/
            docker compose down
          '';
        }
      ];

      home.file.".windows/docker-compose.yml" = {
        text = ''
          services:
            windows:
              image: dockurr/windows
              container_name: windows
              environment:
                DISK_SIZE: "256G"
                VERSION: "https://archive.org/download/tiny11_25H2/tiny11_25H2_Oct25.iso"
              volumes:
                - ./shared:/shared:rw
                - ./storage:/storage:rw
              ports:
                - "8006:8006/tcp"
                - "3389:3389/tcp"
                - "3389:3389/udp"
              cap_add:
                - NET_ADMIN
              devices:
                - /dev/kvm:/dev/kvm:rwm
                - /dev/net/tun:/dev/net/tun:rwm
              networks:
                - windows_default

          networks:
            windows_default:
              driver: bridge
        '';
      };
    };
}
