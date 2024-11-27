# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./nvidia.nix
      ./polybar.nix
      ./steam.nix
      ./bdp.nix
      ./red.nix
    ];

  # luks
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.initrd.luks.devices."luks-49d8e90e-b0ef-44d3-b35e-687d20199f52".device = "/dev/disk/by-uuid/49d8e90e-b0ef-44d3-b35e-687d20199f52";
  boot.initrd.luks.devices."luks-49d8e90e-b0ef-44d3-b35e-687d20199f52".keyFile = "/crypto_keyfile.bin";
  
  # tz and locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  # networking
  networking.hostName = "nixos-dt"; 
  networking.networkmanager.enable = true;

  #hardware configs
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  hardware.bluetooth.enable = true;

  # virtualization
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];

  # yubikey
  security.pam.yubico = {                                           
    enable = true;
    debug = true;
    mode = "challenge-response";      
  };

  # cron
#  services.cron = {
#    enable = true;
#    systemCronJobs = [
   #  "0 18 * * *    rt    . /etc/profile;    /home/rt/scripts/desktop-backup.sh"
#      "*/5 * * * *      root    date >> /tmp/cron.log"
#    ];
  #};

  # xserver
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # services
  services.mullvad-vpn.enable = true;
  services.openssh.enable = true;
  services.blueman.enable = true;
  programs.mtr.enable = true;

  # firewall
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  # user
  users.users.rt = {
    isNormalUser = true;
    description = "rt";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd" ];
  };

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # nopasswd sudo
  security.sudo.extraRules= [
    {  users = [ "rt" ];
      commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ]; 
        }
      ];
    }
  ];

  system.stateVersion = "22.05"; 

}
