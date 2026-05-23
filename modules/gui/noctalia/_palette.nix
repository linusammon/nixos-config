{ self }:
{
  dark = {
    mPrimary = self.theme.base0D;
    mOnPrimary = self.theme.base00;
    mSecondary = self.theme.base0E;
    mOnSecondary = self.theme.base00;
    mTertiary = self.theme.base0C;
    mOnTertiary = self.theme.base00;
    mError = self.theme.base08;
    mOnError = self.theme.base00;
    mSurface = self.theme.base00;
    mOnSurface = self.theme.base05;
    mHover = self.theme.base0C;
    mOnHover = self.theme.base00;
    mSurfaceVariant = self.theme.base01;
    mOnSurfaceVariant = self.theme.base04;
    mOutline = self.theme.base03;
    mShadow = self.theme.base00;
    terminal = {
      foreground = self.theme.base05;
      background = self.theme.base00;
      selectionFg = self.theme.base05;
      selectionBg = self.theme.base03;
      cursorText = self.theme.base00;
      cursor = self.theme.base0D;
      normal = {
        black = self.theme.base02;
        red = self.theme.base08;
        green = self.theme.base0B;
        yellow = self.theme.base0A;
        blue = self.theme.base0D;
        magenta = self.theme.base0E;
        cyan = self.theme.base0C;
        white = self.theme.base05;
      };
      bright = {
        black = self.theme.base03;
        red = self.theme.base09;
        green = self.theme.base0B;
        yellow = self.theme.base0A;
        blue = self.theme.base0D;
        magenta = self.theme.base0E;
        cyan = self.theme.base0C;
        white = self.theme.base07;
      };
    };
  };
}
