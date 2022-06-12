{ config, lib, pkgs, ...}: with lib;
{
	services.xserver = {
		enable = true;
		layout = "us";
	  desktopManager.xfce = {
			enable = true;
			enableXfwm = false;
		};
	  windowManager.bspwm.enable = true;
	  #windowManager.bspwm.package = "pkgs.bspwm-unstable";
		windowManager.default = "bspwm";
		windowManager.bspwm.configFile = "/home/rt/dotfiles/common/bspwm/bspwmrc";
		windowManager.bspwm.sxhkd.configFile= "/home/rt/dotfiles/common/bspwm/sxhkdrc";
		desktopManager.xterm.enable = false;

    displayManager.lightdm = {
      enable = true;
      autoLogin.enable = false;
    };
		#displayManager.auto = {
		#	enable = true;
		#	rt = "rt";
		#};
	};
  services.xrdp.defaultWindowManager = "bspwm";
}
