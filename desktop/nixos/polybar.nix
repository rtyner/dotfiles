{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    let
      polybar = pkgs.polybar.override {
        mpdSupport = true;
        i3Support = true;
      };
    in
      [
        polybar
      ];
}
