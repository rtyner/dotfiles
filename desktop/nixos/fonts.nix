{ config, pkgs, ...}:

{
  fonts.fonts = with pkgs; [
    corefonts
    inconsolata
    unifont
    ubuntu_font_family
    symbola
    nerdfonts
    freefont_ttf
    powerline-fonts
    font-awesome_5
    dejavu_fonts
    google-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];
}
