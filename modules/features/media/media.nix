{ lib, ... }:
{
  flake.modules.homeManager.media =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        showtime
        loupe
        evince
      ];

      xdg = {
        desktopEntries = {
          "org.gnome.Showtime" = {
            name = "Video Player";
            exec = "${lib.getExe pkgs.showtime} %F";
            noDisplay = true;
          };
          "org.gnome.Loupe" = {
            name = "Image Viewer";
            exec = "${lib.getExe pkgs.loupe} %F";
            noDisplay = true;
          };
          "org.gnome.Evince" = {
            name = "Document Viewer";
            exec = "${lib.getExe pkgs.evince} %U";
            noDisplay = true;
          };
        };

        mimeApps.defaultApplications =
          let
            showtime = "org.gnome.Showtime.desktop";
            loupe = "org.gnome.Loupe.desktop";
            evince = "org.gnome.Evince.desktop";

            videoTypes = [
              "video/3gp"
              "video/3gpp"
              "video/3gpp2"
              "video/dv"
              "video/divx"
              "video/fli"
              "video/flv"
              "video/mp2t"
              "video/mp4"
              "video/mp4v-es"
              "video/mpeg"
              "video/mpeg-system"
              "video/msvideo"
              "video/ogg"
              "video/quicktime"
              "video/vivo"
              "video/vnd.divx"
              "video/vnd.mpegurl"
              "video/vnd.rn-realvideo"
              "video/vnd.vivo"
              "video/webm"
              "video/x-anim"
              "video/x-avi"
              "video/x-flc"
              "video/x-fli"
              "video/x-flic"
              "video/x-flv"
              "video/x-m4v"
              "video/x-matroska"
              "video/x-mjpeg"
              "video/x-mpeg"
              "video/x-mpeg2"
              "video/x-ms-asf"
              "video/x-ms-asf-plugin"
              "video/x-ms-asx"
              "video/x-msvideo"
              "video/x-ms-wm"
              "video/x-ms-wmv"
              "video/x-ms-wvx"
              "video/x-nsv"
              "video/x-ogm+ogg"
              "video/x-theora"
              "video/x-theora+ogg"
            ];

            imageTypes = [
              "image/apng"
              "image/bmp"
              "image/gif"
              "image/jp2"
              "image/jpeg"
              "image/png"
              "image/qoi"
              "image/tiff"
              "image/vnd.microsoft.icon"
              "image/webp"
              "image/x-dds"
              "image/x-exr"
              "image/x-portable-anymap"
              "image/x-portable-bitmap"
              "image/x-portable-graymap"
              "image/x-portable-pixmap"
              "image/x-qoi"
              "image/x-tga"
              "image/x-win-bitmap"
              "image/x-xbitmap"
              "image/x-xpixmap"
            ];

            documentTypes = [
              "application/pdf"
              "application/postscript"
              "application/x-dvi"
              "application/vnd.ms-xpsdocument"
              "image/vnd.djvu"
              "image/tiff"
            ];
          in
          (lib.genAttrs imageTypes (_: [ loupe ]))
          // (lib.genAttrs videoTypes (_: [ showtime ]))
          // (lib.genAttrs documentTypes (_: [ evince ]));
      };
    };
}
