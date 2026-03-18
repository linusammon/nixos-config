{
  flake.modules.homeManager.noctalia = {
    programs.noctalia-shell.settings = {
      "appLauncher" = {
        "autoPasteClipboard" = true;
        "clipboardWatchImageCommand" = "wl-paste --type image --watch cliphist store";
        "clipboardWatchTextCommand" = "wl-paste --type text --watch cliphist store";
        "clipboardWrapText" = true;
        "customLaunchPrefix" = "";
        "customLaunchPrefixEnabled" = false;
        "density" = "default";
        "enableClipPreview" = true;
        "enableClipboardHistory" = true;
        "enableSessionSearch" = true;
        "enableSettingsSearch" = false;
        "enableWindowsSearch" = true;
        "iconMode" = "tabler";
        "ignoreMouseInput" = false;
        "overviewLayer" = false;
        "pinnedApps" = [
        ];
        "position" = "center";
        "screenshotAnnotationTool" = "";
        "showCategories" = false;
        "showIconBackground" = false;
        "sortByMostUsed" = false;
        "terminalCommand" = "kitty -e";
        "useApp2Unit" = false;
        "viewMode" = "list";
      };
      "audio" = {
        "mprisBlacklist" = [
        ];
        "preferredPlayer" = "";
        "spectrumFrameRate" = 30;
        "visualizerType" = "linear";
        "volumeFeedback" = false;
        "volumeFeedbackSoundFile" = "";
        "volumeOverdrive" = true;
        "volumeStep" = 5;
      };
      "bar" = {
        "autoHideDelay" = 500;
        "autoShowDelay" = 150;
        "barType" = "simple";
        "capsuleColorKey" = "none";
        "contentPadding" = 2;
        "density" = "default";
        "displayMode" = "always_visible";
        "floating" = false;
        "fontScale" = 1;
        "frameRadius" = 12;
        "frameThickness" = 8;
        "hideOnOverview" = false;
        "marginHorizontal" = 4;
        "marginVertical" = 4;
        "middleClickAction" = "none";
        "middleClickCommand" = "";
        "middleClickFollowMouse" = false;
        "monitors" = [
        ];
        "mouseWheelAction" = "none";
        "mouseWheelWrap" = true;
        "outerCorners" = false;
        "position" = "top";
        "reverseScroll" = false;
        "rightClickAction" = "controlCenter";
        "rightClickCommand" = "";
        "rightClickFollowMouse" = true;
        "screenOverrides" = [
        ];
        "showCapsule" = false;
        "showOnWorkspaceSwitch" = true;
        "showOutline" = false;
        "useSeparateOpacity" = false;
        "widgetSpacing" = 6;
        "widgets" = {
          "center" = [
            {
              "clockColor" = "none";
              "customFont" = "DejaVu Sans Mono";
              "formatHorizontal" = "dddd hh:mm";
              "formatVertical" = "HH mm - dd MM";
              "id" = "Clock";
              "tooltipFormat" = "HH:mm ddd, MMM dd";
              "useCustomFont" = true;
            }
          ];
          "left" = [
            {
              "colorizeDistroLogo" = true;
              "colorizeSystemIcon" = "primary";
              "customIconPath" = "";
              "enableColorization" = true;
              "icon" = "noctalia";
              "id" = "ControlCenter";
              "useDistroLogo" = true;
            }
            {
              "characterCount" = 2;
              "colorizeIcons" = false;
              "emptyColor" = "primary";
              "enableScrollWheel" = true;
              "focusedColor" = "primary";
              "followFocusedScreen" = false;
              "fontWeight" = "bold";
              "groupedBorderOpacity" = 0;
              "hideUnoccupied" = true;
              "iconScale" = 0.8;
              "id" = "Workspace";
              "labelMode" = "index";
              "occupiedColor" = "primary";
              "pillSize" = 0.6;
              "showApplications" = true;
              "showBadge" = true;
              "showLabelsOnlyWhenOccupied" = false;
              "unfocusedIconsOpacity" = 0.7;
            }
          ];
          "right" = [
            {
              "blacklist" = [
              ];
              "chevronColor" = "none";
              "colorizeIcons" = false;
              "drawerEnabled" = true;
              "hidePassive" = false;
              "id" = "Tray";
              "pinned" = [
              ];
            }
            {
              "hideWhenZero" = false;
              "hideWhenZeroUnread" = false;
              "iconColor" = "none";
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
              "unreadBadgeColor" = "primary";
            }
            {
              "iconColor" = "none";
              "id" = "NightLight";
            }
            {
              "iconColor" = "none";
              "id" = "KeepAwake";
              "textColor" = "none";
            }
            {
              "displayMode" = "onhover";
              "iconColor" = "none";
              "id" = "Volume";
              "middleClickCommand" = "pwvucontrol || pavucontrol";
              "textColor" = "none";
            }
            {
              "displayMode" = "onhover";
              "iconColor" = "none";
              "id" = "Bluetooth";
              "textColor" = "none";
            }
            {
              "displayMode" = "onhover";
              "iconColor" = "none";
              "id" = "Network";
              "textColor" = "none";
            }
            {
              "deviceNativePath" = "__default__";
              "displayMode" = "onhover";
              "hideIfIdle" = false;
              "hideIfNotDetected" = true;
              "id" = "Battery";
              "showNoctaliaPerformance" = false;
              "showPowerProfiles" = true;
            }
          ];
        };
      };
      "brightness" = {
        "backlightDeviceMappings" = [
        ];
        "brightnessStep" = 5;
        "enableDdcSupport" = false;
        "enforceMinimum" = true;
      };
      "calendar" = {
        "cards" = [
          {
            "enabled" = true;
            "id" = "calendar-header-card";
          }
          {
            "enabled" = true;
            "id" = "calendar-month-card";
          }
          {
            "enabled" = false;
            "id" = "weather-card";
          }
        ];
      };
      "colorSchemes" = {
        "darkMode" = true;
        "generationMethod" = "tonal-spot";
        "manualSunrise" = "06 =30";
        "manualSunset" = "18 =30";
        "monitorForColors" = "";
        "predefinedScheme" = "Noctalia (default)";
        "schedulingMode" = "off";
        "useWallpaperColors" = false;
      };
      "controlCenter" = {
        "cards" = [
          {
            "enabled" = true;
            "id" = "profile-card";
          }
          {
            "enabled" = false;
            "id" = "shortcuts-card";
          }
          {
            "enabled" = false;
            "id" = "audio-card";
          }
          {
            "enabled" = false;
            "id" = "brightness-card";
          }
          {
            "enabled" = true;
            "id" = "weather-card";
          }
          {
            "enabled" = true;
            "id" = "media-sysmon-card";
          }
        ];
        "diskPath" = "/";
        "position" = "close_to_bar_button";
        "shortcuts" = {
          "left" = [
          ];
          "right" = [
          ];
        };
      };
      "desktopWidgets" = {
        "enabled" = true;
        "gridSnap" = true;
        "monitorWidgets" = [
        ];
        "overviewEnabled" = true;
      };
      "dock" = {
        "animationSpeed" = 1;
        "colorizeIcons" = false;
        "deadOpacity" = 0.6;
        "displayMode" = "auto_hide";
        "dockType" = "floating";
        "enabled" = false;
        "floatingRatio" = 1;
        "groupApps" = false;
        "groupClickAction" = "cycle";
        "groupContextMenuMode" = "extended";
        "groupIndicatorStyle" = "dots";
        "inactiveIndicators" = false;
        "indicatorColor" = "primary";
        "indicatorOpacity" = 0.6;
        "indicatorThickness" = 3;
        "launcherIconColor" = "none";
        "launcherPosition" = "end";
        "monitors" = [
        ];
        "onlySameOutput" = true;
        "pinnedApps" = [
        ];
        "pinnedStatic" = false;
        "position" = "bottom";
        "showDockIndicator" = false;
        "showLauncherIcon" = false;
        "sitOnFrame" = false;
        "size" = 1;
      };
      "general" = {
        "allowPanelsOnScreenWithoutBar" = true;
        "allowPasswordWithFprintd" = false;
        "animationDisabled" = false;
        "animationSpeed" = 1;
        "autoStartAuth" = false;
        "avatarImage" = "/home/linus/.face";
        "boxRadiusRatio" = 1;
        "clockFormat" = "hh\\nmm";
        "clockStyle" = "custom";
        "compactLockScreen" = true;
        "dimmerOpacity" = 0.2;
        "enableBlurBehind" = true;
        "enableLockScreenCountdown" = true;
        "enableLockScreenMediaControls" = false;
        "enableShadows" = true;
        "forceBlackScreenCorners" = false;
        "iRadiusRatio" = 0;
        "keybinds" = {
          "keyDown" = [
            "Down"
          ];
          "keyEnter" = [
            "Return"
            "Enter"
          ];
          "keyEscape" = [
            "Esc"
          ];
          "keyLeft" = [
            "Left"
          ];
          "keyRemove" = [
            "Del"
          ];
          "keyRight" = [
            "Right"
          ];
          "keyUp" = [
            "Up"
          ];
        };
        "language" = "";
        "lockOnSuspend" = true;
        "lockScreenAnimations" = false;
        "lockScreenBlur" = 0.3;
        "lockScreenCountdownDuration" = 3000;
        "lockScreenMonitors" = [
        ];
        "lockScreenTint" = 0;
        "passwordChars" = false;
        "radiusRatio" = 0;
        "reverseScroll" = false;
        "scaleRatio" = 1;
        "screenRadiusRatio" = 1;
        "shadowDirection" = "bottom_right";
        "shadowOffsetX" = 2;
        "shadowOffsetY" = 3;
        "showChangelogOnStartup" = true;
        "showHibernateOnLockScreen" = false;
        "showScreenCorners" = false;
        "showSessionButtonsOnLockScreen" = true;
        "telemetryEnabled" = false;
      };
      "hooks" = {
        "darkModeChange" = "";
        "enabled" = false;
        "performanceModeDisabled" = "";
        "performanceModeEnabled" = "";
        "screenLock" = "";
        "screenUnlock" = "";
        "session" = "";
        "startup" = "";
        "wallpaperChange" = "";
      };
      "idle" = {
        "customCommands" = "[]";
        "enabled" = true;
        "fadeDuration" = 5;
        "lockCommand" = "";
        "lockTimeout" = 300;
        "resumeLockCommand" = "";
        "resumeScreenOffCommand" = "";
        "resumeSuspendCommand" = "";
        "screenOffCommand" = "";
        "screenOffTimeout" = 0;
        "suspendCommand" = "";
        "suspendTimeout" = 1200;
      };
      "location" = {
        "analogClockInCalendar" = false;
        "firstDayOfWeek" = 1;
        "hideWeatherCityName" = false;
        "hideWeatherTimezone" = false;
        "name" = "Bern";
        "showCalendarEvents" = true;
        "showCalendarWeather" = true;
        "showWeekNumberInCalendar" = false;
        "use12hourFormat" = false;
        "useFahrenheit" = false;
        "weatherEnabled" = true;
        "weatherShowEffects" = true;
      };
      "network" = {
        "airplaneModeEnabled" = false;
        "bluetoothAutoConnect" = true;
        "bluetoothDetailsViewMode" = "grid";
        "bluetoothHideUnnamedDevices" = false;
        "bluetoothRssiPollIntervalMs" = 10000;
        "bluetoothRssiPollingEnabled" = true;
        "disableDiscoverability" = false;
        "networkPanelView" = "wifi";
        "wifiDetailsViewMode" = "grid";
        "wifiEnabled" = true;
      };
      "nightLight" = {
        "autoSchedule" = true;
        "dayTemp" = "6500";
        "enabled" = false;
        "forced" = false;
        "manualSunrise" = "06 =30";
        "manualSunset" = "18 =30";
        "nightTemp" = "4000";
      };
      "noctaliaPerformance" = {
        "disableDesktopWidgets" = true;
        "disableWallpaper" = true;
      };
      "notifications" = {
        # "backgroundOpacity" = 1;
        "clearDismissed" = true;
        "criticalUrgencyDuration" = 15;
        "density" = "default";
        "enableBatteryToast" = true;
        "enableKeyboardLayoutToast" = true;
        "enableMarkdown" = false;
        "enableMediaToast" = false;
        "enabled" = true;
        "location" = "top_right";
        "lowUrgencyDuration" = 3;
        "monitors" = [
        ];
        "normalUrgencyDuration" = 8;
        "overlayLayer" = true;
        "respectExpireTimeout" = false;
        "saveToHistory" = {
          "critical" = true;
          "low" = true;
          "normal" = true;
        };
        "sounds" = {
          "criticalSoundFile" = "";
          "enabled" = false;
          "excludedApps" = "discord;firefox;chrome;chromium;edge";
          "lowSoundFile" = "";
          "normalSoundFile" = "";
          "separateSounds" = false;
          "volume" = 0.5;
        };
      };
      "osd" = {
        "autoHideMs" = 2000;
        # "backgroundOpacity" = 1;
        "enabled" = true;
        "enabledTypes" = [
          0
          1
          2
        ];
        "location" = "top_right";
        "monitors" = [
        ];
        "overlayLayer" = true;
      };
      "plugins" = {
        "autoUpdate" = false;
      };
      "sessionMenu" = {
        "countdownDuration" = 3000;
        "enableCountdown" = true;
        "largeButtonsLayout" = "grid";
        "largeButtonsStyle" = true;
        "position" = "center";
        "powerOptions" = [
          {
            "action" = "lock";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "1";
          }
          {
            "action" = "logout";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "2";
          }
          {
            "action" = "suspend";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "3";
          }
          {
            "action" = "hibernate";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "4";
          }
          {
            "action" = "reboot";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "5";
          }
          {
            "action" = "shutdown";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = true;
            "keybind" = "6";
          }
          {
            "action" = "userspaceReboot";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = false;
            "keybind" = "";
          }
          {
            "action" = "rebootToUefi";
            "command" = "";
            "countdownEnabled" = true;
            "enabled" = false;
            "keybind" = "";
          }
        ];
        "showHeader" = true;
        "showKeybinds" = false;
      };
      "settingsVersion" = 57;
      "systemMonitor" = {
        "batteryCriticalThreshold" = 5;
        "batteryWarningThreshold" = 20;
        "cpuCriticalThreshold" = 90;
        "cpuWarningThreshold" = 80;
        "criticalColor" = "";
        "diskAvailCriticalThreshold" = 10;
        "diskAvailWarningThreshold" = 20;
        "diskCriticalThreshold" = 90;
        "diskWarningThreshold" = 80;
        "enableDgpuMonitoring" = false;
        "externalMonitor" =
          "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        "gpuCriticalThreshold" = 90;
        "gpuWarningThreshold" = 80;
        "memCriticalThreshold" = 90;
        "memWarningThreshold" = 80;
        "swapCriticalThreshold" = 90;
        "swapWarningThreshold" = 80;
        "tempCriticalThreshold" = 90;
        "tempWarningThreshold" = 80;
        "useCustomColors" = false;
        "warningColor" = "";
      };
      "templates" = {
        "activeTemplates" = [
        ];
        "enableUserTheming" = false;
      };
      "ui" = {
        "boxBorderEnabled" = false;
        "fontDefault" = "DejaVu Sans";
        "fontDefaultScale" = 1;
        "fontFixed" = "DejaVu Sans Mono";
        "fontFixedScale" = 1;
        "panelsAttachedToBar" = true;
        "settingsPanelMode" = "window";
        "settingsPanelSideBarCardStyle" = false;
        "tooltipsEnabled" = true;
        "translucentWidgets" = true;
      };
      "wallpaper" = {
        "automationEnabled" = false;
        "directory" = "";
        "enableMultiMonitorDirectories" = false;
        "enabled" = true;
        "favorites" = [
        ];
        "fillColor" = "#000000";
        "fillMode" = "crop";
        "hideWallpaperFilenames" = true;
        "monitorDirectories" = [
        ];
        "overviewBlur" = 0.4;
        "overviewEnabled" = true;
        "overviewTint" = 0.6;
        "panelPosition" = "center";
        "randomIntervalSec" = 300;
        "setWallpaperOnAllMonitors" = true;
        "showHiddenFiles" = false;
        "skipStartupTransition" = true;
        "solidColor" = "#1a1a2e";
        "sortOrder" = "name";
        "transitionDuration" = 1500;
        "transitionEdgeSmoothness" = 0.05;
        "transitionType" = "random";
        "useSolidColor" = false;
        "useWallhaven" = false;
        "viewMode" = "single";
        "wallhavenApiKey" = "";
        "wallhavenCategories" = "111";
        "wallhavenOrder" = "desc";
        "wallhavenPurity" = "100";
        "wallhavenQuery" = "";
        "wallhavenRatios" = "";
        "wallhavenResolutionHeight" = "";
        "wallhavenResolutionMode" = "atleast";
        "wallhavenResolutionWidth" = "";
        "wallhavenSorting" = "relevance";
        "wallpaperChangeMode" = "random";
      };
    };
  };
}
