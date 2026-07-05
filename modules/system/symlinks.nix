{
  modules.nixos.system.symlinks =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      cfg = config.custom.symlinks;

      manifest = pkgs.writeText "config-symlinks-manifest" (
        cfg.files |> lib.attrNames |> lib.concatStringsSep "\n"
      );

      fileSpecs = lib.concatStringsSep "\n" (
        lib.mapAttrsToList (
          name: content:
          let
            source = pkgs.writeText (lib.replaceStrings [ "/" ] [ "-" ] name) content;
          in
          "${name}\t${source}"
        ) cfg.files
      );

      manageScript = pkgs.writeShellScript "manage-config-symlinks" ''
        set -euo pipefail

        STATE_DIR="''${XDG_STATE_HOME:-$HOME/.local/state}"
        mkdir -p "$STATE_DIR"

        MANIFEST_PATH="$STATE_DIR/config-symlinks-manifest"
        NEW_MANIFEST="${manifest}"
        OLD_MANIFEST="$MANIFEST_PATH.prev"

        if [ -f "$MANIFEST_PATH" ]; then
          cp "$MANIFEST_PATH" "$OLD_MANIFEST"
        else
          touch "$OLD_MANIFEST"
        fi

        CONFIG_DIR="''${XDG_CONFIG_HOME:-$HOME/.config}"

        while IFS=$'\t' read -r name source; do
          [ -z "$name" ] && continue
          target="$CONFIG_DIR/$name"
          mkdir -p "$(dirname "$target")"
          ln -sfn "$source" "$target"
        done <<EOF
        ${fileSpecs}
        EOF

        if [ -f "$OLD_MANIFEST" ]; then
          while IFS= read -r name; do
            if [ -n "$name" ] && ! grep -qxF "$name" "$NEW_MANIFEST"; then
              target="$CONFIG_DIR/$name"
              if [ -L "$target" ]; then
                rm -f "$target"
                parent="$(dirname "$target")"
                while [ "$parent" != "$CONFIG_DIR" ] && [ "$parent" != "/" ]; do
                  rmdir "$parent" 2>/dev/null || break
                  parent="$(dirname "$parent")"
                done
              fi
            fi
          done < "$OLD_MANIFEST"
        fi

        cp "$NEW_MANIFEST" "$MANIFEST_PATH.tmp"
        mv "$MANIFEST_PATH.tmp" "$MANIFEST_PATH"
      '';
    in
    {
      options.custom.symlinks = {
        files = lib.mkOption {
          type = lib.types.attrsOf lib.types.lines;
          default = { };
        };
      };

      config.systemd.user.services.config-symlinks = {
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = manageScript;
        };
        wantedBy = [ "default.target" ];
      };
    };
}
