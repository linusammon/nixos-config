{ inputs, ... }:
{
  flake.modules.homeManager.firefox =
    { pkgs, config, ... }:
    {
      programs.firefox = {
        enable = true;

        profiles.default = {
          isDefault = true;

          settings = {
            # Restore previous tabs and windows
            "browser.startup.page" = 3;

            # Automatically enable extensions
            "extensions.autoDisableScopes" = 0;

            # Disable irritating first-run stuff
            "browser.disableResetPrompt" = true;
            "browser.download.panel.shown" = true;
            "browser.feeds.showFirstRunUI" = false;
            "browser.messaging-system.whatsNewPanel.enabled" = false;
            "browser.rights.3.shown" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.shell.defaultBrowserCheckCount" = 1;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.uitour.enabled" = false;
            "startup.homepage_override_url" = "";
            "trailhead.firstrun.didSeeAboutWelcome" = true;
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.bookmarks.addedImportButton" = true;

            # Don't ask for download dir
            "browser.download.useDownloadDir" = false;
            "browser.download.dir" = "${config.home.homeDirectory}/downloads";

            # Disable crappy home activity stream page
            "browser.newtabpage.activity-stream.feeds.topsites" = false;

            # Disable some telemetry
            "app.shield.optoutstudies.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "datareporting.healthreport.service.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.sessions.current.clean" = true;
            "devtools.onboarding.telemetry.logged" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.prompted" = 2;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.unifiedIsOptIn" = false;
            "toolkit.telemetry.updatePing.enabled" = false;

            # Disable fx accounts
            "identity.fxaccounts.enabled" = false;

            # Disable "save password" prompt
            "signon.rememberSignons" = false;

            # Harden
            "privacy.trackingprotection.enabled" = true;
            "dom.security.https_only_mode" = true;

            # Remove close button
            "browser.tabs.inTitlebar" = 0;

            # Disable bookmarks in toolbar
            "browser.toolbars.bookmarks.visibility" = "never";

            # Vertical tabs
            "sidebar.verticalTabs" = true;
            "sidebar.revamp" = true;
            "sidebar.main.tools" = "bookmarks,history";

            # Layout
            "browser.uiCustomization.state" = builtins.toJSON {
              placements = {
                unified-extensions-area = [ ];
                widget-overflow-fixed-list = [ ];
                nav-bar = [
                  "sidebar-button"
                  "back-button"
                  "forward-button"
                  "vertical-spacer"
                  "stop-reload-button"
                  "customizableui-special-spring12"
                  "urlbar-container"
                  "customizableui-special-spring13"
                  "downloads-button"
                  "unified-extensions-button"
                ];
                toolbar-menubar = [ "menubar-items" ];
                TabsToolbar = [ ];
                vertical-tabs = [ "tabbrowser-tabs" ];
                PersonalToolbar = [ "personal-bookmarks" ];
              };
              seen = [
                "save-to-pocket-button"
                "developer-button"
                "ublock0_raymondhill_net-browser-action"
                "_testpilot-containers-browser-action"
                "screenshot-button"
              ];
              dirtyAreaCache = [
                "nav-bar"
                "PersonalToolbar"
                "toolbar-menubar"
                "TabsToolbar"
                "widget-overflow-fixed-list"
                "vertical-tabs"
              ];
              currentVersion = 23;
              newElementCount = 13;
            };
          };

          search = {
            force = true;

            default = "ddg";
            privateDefault = "ddg";

            order = [
              "ddg"
              "google"
              "wikipedia"
              "Nix Packages"
              "Nix Options"
              "Home Manager Options"
            ];

            engines = {
              "Nix Packages" = {
                definedAliases = [ "@np" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
              };

              "Nix Options" = {
                definedAliases = [ "@no" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                urls = [
                  {
                    template = "https://search.nixos.org/options";
                    params = [
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
              };

              "Home Manager Options" = {
                definedAliases = [ "@ho" ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                urls = [
                  {
                    template = "https://home-manager-options.extranix.com/";
                    params = [
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
              };
            };
          };

          extensions = {
            force = true;

            packages = with inputs.firefox-addons.packages.${pkgs.system}; [
              adaptive-tab-bar-colour
              ublock-origin
              bitwarden
              darkreader
            ];
          };
        };
      };

      home.persistence."/persistent".directories = [
        ".mozilla/firefox"
      ];
    };
}
