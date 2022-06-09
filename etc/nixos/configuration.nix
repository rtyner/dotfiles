{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;
  hardware.opengl.driSupport32Bit = true;

#      windowManager = {
#        i3.enable = true;
#        i3.package = pkgs.i3-gaps;
#        i3.extraPackages = with pkgs; [
#          dmenu #application launcher most people use
#          i3lock #default i3 screen locker
#          # i3status # gives you the default i3 status bar
#          # i3blocks #if you are planning on using i3blocks over i3status
#          unstable.i3status-rust
#          i3-gaps
#          i3lock-fancy
#          xautolock
#          rofi
#          numlockx
#          # conky
#          # rxvt_unicode
#          rxvt_unicode-with-plugins
#          (lowPrio urxvt_perls)
#          (lowPrio urxvt_font_size)
#          acpilight
#          glxinfo
#          pavucontrol
#          networkmanager_dmenu
#          arandr
#          escrotum
#          obs-studio
#          libva-utils
#          gnome3.networkmanagerapplet
#        ];
#      };
#    };
#  };

  # video drivers
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "DRI" "2"
    Option "TearFree" "true"
  '';

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = false;
#  hardware.trackpoint.fakeButtons = true;

  # power management/battery
  services.tlp.enable = true;
  services.upower.enable = true;

  users.users.rt = {
    isNormalUser = true;
    description = "rt";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  fileSystems."/mnt/big-dick-pool" = {
      device = "//10.1.1.6/big-dick-pool";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-ti
meout=5s";

      in ["${automount_opts},credentials=/home/rt/.config/smb/.creds,uid=1000,gid=1000"];
  };

  # system packages

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim 
    rxvt-unicode
    wget
    curl
    git
    htop
    python
    dmenu
    rofi
    ranger
    polybar
    neovim
    alacritty
    librewolf
    vscodium
    obsidian
    chromium
    firefox
    discord
    neofetch
    _1password-gui
    scrot
    logseq
    zsh
    zsh-syntax-highlighting
    rclone
    rsync
    unzip
    pavucontrol
    networkmanager_dmenu
    arandr
    escrotum
    obs-studio
    pkgs.networkmanagerapplet    
    gnome.cheese
    ffmpeg-full
    tmux 
    screen
    awscli
    ansible
    terraform
    filezilla
    vlc
    fzf
    bat
    zathura
    feh
    imagemagick
    youtube-dl
    yubikey-manager
    yubico-piv-tool
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubioath-desktop
    yubico-pam
    mtr
    tcpdump
    iperf
    nload
    protonvpn-cli
    protonvpn-gui
    wireguard-tools
    wirelesstools
    unrar
    whois
    file
    which
    nmap
    cryptsetup
    libgnome-keyring
  ];

    fonts.fonts = with pkgs; [
      corefonts
      inconsolata
      unifont
      ubuntu_font_family
      symbola
      nerdfonts
      freefont_ttf
      powerline-fonts
      font-awesome
      font-awesome_4
      dejavu_fonts
      google-fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
    ];

  security.sudo.extraRules= [
    {  users = [ "rt" ];
      commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
        }
      ];
    }
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

   services.openssh.enable = true;
   services.printing.enable = true;

   networking.firewall.allowedTCPPorts = [ 22];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  
  system.stateVersion = "22.05"; # Did you read the comment?

}
