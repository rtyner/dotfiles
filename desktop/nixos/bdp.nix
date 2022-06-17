{
  fileSystems."/home/rt/mnt/big-dick-pool" = {
      device = "//10.1.1.6/big-dick-pool";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/home/rt/.smbcreds,uid=1000,gid=100"];
  };
}
