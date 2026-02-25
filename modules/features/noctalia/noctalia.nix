{ inputs, self, ... }:
{
  flake.modules.homeManager.noctalia =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
        # self.modules.homeManager.cliphist
      ];

      home.packages = with pkgs; [ wtype ];

      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;

        plugins = {
          sources = [
            {
              enabled = true;
              name = "Official Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
          ];
          states = {
            kaomoji-provider = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            translator = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            unicode-picker = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          };
          version = 1;
        };

        settings = {
          appLauncher = {
            autoPasteClipboard = true;
            clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
            clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
            clipboardWrapText = true;
            customLaunchPrefix = "";
            customLaunchPrefixEnabled = false;
            enableClipPreview = true;
            enableClipboardHistory = true;
            enableSettingsSearch = false;
            enableWindowsSearch = true;
            iconMode = "tabler";
            ignoreMouseInput = false;
            pinnedApps = [ ];
            position = "center";
            screenshotAnnotationTool = "";
            showCategories = false;
            showIconBackground = false;
            sortByMostUsed = true;
            terminalCommand = "kitty -e";
            useApp2Unit = false;
            viewMode = "list";
          };

          audio = {
            cavaFrameRate = 30;
            mprisBlacklist = [ ];
            preferredPlayer = "";
            visualizerType = "linear";
            volumeFeedback = false;
            volumeOverdrive = false;
            volumeStep = 5;
          };

          bar = {
            autoHideDelay = 500;
            autoShowDelay = 150;
            barType = "simple";
            density = "default";
            displayMode = "always_visible";
            floating = false;
            frameRadius = 12;
            frameThickness = 8;
            hideOnOverview = false;
            marginHorizontal = 4;
            marginVertical = 4;
            monitors = [ ];
            outerCorners = false;
            position = "top";
            screenOverrides = [ ];
            showCapsule = false;
            showOutline = false;
            useSeparateOpacity = false;

            widgets = {
              center = [
                {
                  customFont = "DejaVu Sans Mono";
                  formatHorizontal = "dddd hh:mm";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = true;
                  usePrimaryColor = false;
                }
              ];

              left = [
                {
                  colorizeDistroLogo = true;
                  colorizeSystemIcon = "tertiary";
                  customIconPath = "";
                  enableColorization = true;
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "tertiary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  groupedBorderOpacity = 0;
                  hideUnoccupied = false;
                  iconScale = 0.8;
                  id = "Workspace";
                  labelMode = "index";
                  occupiedColor = "tertiary";
                  reverseScroll = false;
                  showApplications = true;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = true;
                  unfocusedIconsOpacity = 0.7;
                }
              ];

              right = [
                {
                  blacklist = [ ];
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [ ];
                }
                {
                  hideWhenZero = true;
                  hideWhenZeroUnread = false;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                }
                {
                  id = "NightLight";
                }
                {
                  id = "KeepAwake";
                }
                {
                  displayMode = "onhover";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                }
                {
                  displayMode = "onhover";
                  id = "Bluetooth";
                }
                {
                  displayMode = "onhover";
                  id = "Network";
                }
                {
                  deviceNativePath = "__default__";
                  displayMode = "onhover";
                  hideIfIdle = false;
                  hideIfNotDetected = true;
                  id = "Battery";
                  showNoctaliaPerformance = false;
                  showPowerProfiles = true;
                  warningThreshold = 30;
                }
              ];
            };
          };

          brightness = {
            brightnessStep = 5;
            enableDdcSupport = false;
            enforceMinimum = true;
          };

          calendar.cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = false;
              id = "weather-card";
            }
          ];

          colorSchemes = {
            darkMode = true;
            generationMethod = "tonal-spot";
            manualSunrise = "06:30";
            manualSunset = "18:30";
            monitorForColors = "";
            predefinedScheme = "Noctalia (default)";
            schedulingMode = "off";
            useWallpaperColors = false;
          };

          controlCenter = {
            cards = [
              {
                enabled = true;
                id = "profile-card";
              }
              {
                enabled = false;
                id = "shortcuts-card";
              }
              {
                enabled = false;
                id = "audio-card";
              }
              {
                enabled = false;
                id = "brightness-card";
              }
              {
                enabled = true;
                id = "weather-card";
              }
              {
                enabled = true;
                id = "media-sysmon-card";
              }
            ];
            diskPath = "/";
            position = "close_to_bar_button";
            shortcuts.left = [ ];
            shortcuts.right = [ ];
          };

          desktopWidgets = {
            enabled = true;
            gridSnap = true;
            monitorWidgets = [ ];
          };

          dock = {
            animationSpeed = 1;
            colorizeIcons = false;
            deadOpacity = 0.6;
            displayMode = "auto_hide";
            enabled = false;
            floatingRatio = 1;
            inactiveIndicators = false;
            monitors = [ ];
            onlySameOutput = true;
            pinnedApps = [ ];
            pinnedStatic = false;
            position = "bottom";
            size = 1;
          };

          general = {
            allowPanelsOnScreenWithoutBar = true;
            allowPasswordWithFprintd = false;
            animationDisabled = false;
            animationSpeed = 1;
            autoStartAuth = false;
            avatarImage = "/home/linus/.face";
            boxRadiusRatio = 1;
            compactLockScreen = true;
            dimmerOpacity = 0.2;
            enableLockScreenCountdown = true;
            enableShadows = true;
            forceBlackScreenCorners = false;
            iRadiusRatio = 0;
            language = "";
            lockOnSuspend = true;
            lockScreenCountdownDuration = 3000;
            radiusRatio = 0;
            scaleRatio = 1;
            screenRadiusRatio = 1;
            shadowDirection = "bottom_right";
            shadowOffsetX = 2;
            shadowOffsetY = 3;
            showChangelogOnStartup = true;
            showHibernateOnLockScreen = false;
            showScreenCorners = false;
            showSessionButtonsOnLockScreen = true;
            telemetryEnabled = false;
          };

          hooks = {
            darkModeChange = "";
            enabled = false;
            performanceModeDisabled = "";
            performanceModeEnabled = "";
            screenLock = "";
            screenUnlock = "";
            session = "";
            startup = "";
            wallpaperChange = "";
          };

          location = {
            analogClockInCalendar = false;
            firstDayOfWeek = 1;
            hideWeatherCityName = false;
            hideWeatherTimezone = false;
            name = "Bern";
            showCalendarEvents = true;
            showCalendarWeather = true;
            showWeekNumberInCalendar = false;
            use12hourFormat = false;
            useFahrenheit = false;
            weatherEnabled = true;
            weatherShowEffects = true;
          };

          network = {
            bluetoothDetailsViewMode = "grid";
            bluetoothHideUnnamedDevices = false;
            bluetoothRssiPollIntervalMs = 10000;
            bluetoothRssiPollingEnabled = true;
            wifiDetailsViewMode = "grid";
            wifiEnabled = true;
          };

          nightLight = {
            autoSchedule = true;
            dayTemp = "6500";
            enabled = false;
            forced = false;
            manualSunrise = "06:30";
            manualSunset = "18:30";
            nightTemp = "4000";
          };

          notifications = {
            criticalUrgencyDuration = 15;
            enableKeyboardLayoutToast = true;
            enableMediaToast = false;
            enabled = true;
            location = "top_right";
            lowUrgencyDuration = 3;
            monitors = [ ];
            normalUrgencyDuration = 8;
            overlayLayer = true;
            respectExpireTimeout = false;
            saveToHistory = {
              critical = true;
              low = true;
              normal = true;
            };
            sounds = {
              criticalSoundFile = "";
              enabled = false;
              excludedApps = "discord,firefox,chrome,chromium,edge";
              lowSoundFile = "";
              normalSoundFile = "";
              separateSounds = false;
              volume = 0.5;
            };
          };

          osd = {
            autoHideMs = 2000;
            enabled = true;
            enabledTypes = [
              0
              1
              2
            ];
            location = "top_right";
            monitors = [ ];
            overlayLayer = true;
          };

          sessionMenu = {
            countdownDuration = 3000;
            enableCountdown = true;
            largeButtonsLayout = "grid";
            largeButtonsStyle = true;
            position = "center";
            powerOptions = [
              {
                action = "lock";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "1";
              }
              {
                action = "logout";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "2";
              }
              {
                action = "shutdown";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "3";
              }
              {
                action = "suspend";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "4";
              }
              {
                action = "hibernate";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "5";
              }
              {
                action = "reboot";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "6";
              }
            ];
            showHeader = true;
            showNumberLabels = true;
          };

          systemMonitor = {
            cpuCriticalThreshold = 90;
            cpuPollingInterval = 1000;
            cpuWarningThreshold = 80;
            criticalColor = "";
            diskCriticalThreshold = 90;
            diskPollingInterval = 30000;
            diskWarningThreshold = 80;
            enableDgpuMonitoring = false;
            externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
            gpuCriticalThreshold = 90;
            gpuPollingInterval = 3000;
            gpuWarningThreshold = 80;
            loadAvgPollingInterval = 3000;
            memCriticalThreshold = 90;
            memPollingInterval = 1000;
            memWarningThreshold = 80;
            networkPollingInterval = 1000;
            swapCriticalThreshold = 90;
            swapWarningThreshold = 80;
            tempCriticalThreshold = 90;
            tempWarningThreshold = 80;
            useCustomColors = false;
            warningColor = "";
          };

          templates = {
            activeTemplates = [ ];
            enableUserTheming = false;
          };

          ui = {
            bluetoothDetailsViewMode = "grid";
            bluetoothHideUnnamedDevices = false;
            boxBorderEnabled = false;
            fontDefault = "DejaVu Sans";
            fontDefaultScale = 1;
            fontFixed = "DejaVu Sans Mono";
            fontFixedScale = 1;
            networkPanelView = "wifi";
            panelsAttachedToBar = true;
            settingsPanelMode = "window";
            tooltipsEnabled = true;
            wifiDetailsViewMode = "grid";
          };

          wallpaper = {
            automationEnabled = false;
            directory = "";
            enableMultiMonitorDirectories = false;
            enabled = true;
            fillColor = "#000000";
            fillMode = "crop";
            hideWallpaperFilenames = true;
            monitorDirectories = [ ];
            overviewEnabled = false;
            panelPosition = "center";
            randomIntervalSec = 300;
            setWallpaperOnAllMonitors = true;
            showHiddenFiles = false;
            solidColor = "#1a1a2e";
            sortOrder = "name";
            transitionDuration = 1500;
            transitionEdgeSmoothness = 0.05;
            transitionType = "random";
            useSolidColor = false;
            useWallhaven = false;
            viewMode = "single";
            wallhavenApiKey = "";
            wallhavenCategories = "111";
            wallhavenOrder = "desc";
            wallhavenPurity = "100";
            wallhavenQuery = "";
            wallhavenRatios = "";
            wallhavenResolutionHeight = "";
            wallhavenResolutionMode = "atleast";
            wallhavenResolutionWidth = "";
            wallhavenSorting = "relevance";
            wallpaperChangeMode = "random";
          };
        };
      };

      programs.niri.settings.binds = {
        # Toggle app launcher
        "Mod+Space".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];

        # Toggle session menu
        "Mod+Escape".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "sessionMenu"
          "toggle"
        ];
      };

      home.persistence."/persist".directories = [
        ".config/noctalia"
      ];
    };
}
