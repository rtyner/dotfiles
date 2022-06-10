{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; 
  # networking.wireless.enable = true;  
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;
  hardware.opengl.driSupport32Bit = true;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = false;
  hardware.trackpoint.enable = true;
  hardware.trackpoint.device = "Elan Trackpoint";
  services.tlp.enable = true;
  services.upower.enable = true;
  services.xserver.deviceSection = ''
    Option "DRI" "2"
    Option "TearFree" "true"
  '';
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.rt = {
    isNormalUser = true;
    description = "rt";
    shell = pkgs.bash;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  fileSystems."/mnt/big-dick-pool" = {
      device = "//10.1.1.6/big-dick-pool";
      fsType = "cifs";
      options = let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-ti
meout=5s";

      in ["${automount_opts},credentials=/home/rt/.config/smb/.creds,uid=1000,gid=1000"];
  };

  # system packages

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    xorg.xbacklight
    vim 
    wget
    curl
    git
    htop
    python
    dmenu
    rofi
    ranger
    polybar
    zsh
    mullvad-vpn
    zsh-syntax-highlighting
    rclone
    rsync
    unzip
    pavucontrol
    networkmanager_dmenu
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
    rxvt-unicode
    logseq
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
    standardnotes
    pcmanfm
    lxappearance
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

   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };


   services.openssh.enable = true;
   services.printing.enable = true;
   services.mullvad-vpn.enable = true;
   hardware.acpilight.enable = true;

   networking.firewall.allowedTCPPorts = [ 22];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  
  system.stateVersion = "22.05"; # Did you read the comment?

}
