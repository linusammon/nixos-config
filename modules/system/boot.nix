{
  modules.nixos.system.boot = _: {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          memtest86.enable = true;
          consoleMode = "max";
          editor = false;
        };

        efi.canTouchEfiVariables = true;
      };

      initrd.verbose = false;
    };
  };
}
