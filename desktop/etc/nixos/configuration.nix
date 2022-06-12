{ config, pkgs, ...}:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./nvidia.nix
    ];

  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # luks
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-6b30a91c-ebeb-42a4-a357-cc1a0ee33555".device = "/dev/disk/by-uuid/6b30a91c-ebeb-42a4-a357-cc1a0ee33555";
  boot.initrd.luks.devices."luks-6b30a91c-ebeb-42a4-a357-cc1a0ee33555".keyFile = "/crypto_keyfile.bin";

  # networking
  networking.hostName = "nixos-dt";
  networking.networkmanager.enable = true;

  # time/locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # user
  users.users.rt = {
    isNormalUser = true;
    description = "rt";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  #zsh
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

   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # services
  services.openssh.enable = true;
  services.printing.enable = true;
  services.mullvad-vpn.enable = true;

  # xserver
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # firewall
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "22.05"; # Did you read the comment?

}
