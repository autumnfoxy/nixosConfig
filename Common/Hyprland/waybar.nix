{config, pkgs, lib, ...}:
{
  options = {
    waybar.enable = lib.mkEnableOption "Enables & configures Waybar";
  };

  config = lib.mkIf config.waybar.enable {
    environment.systemPackages = [ pkgs.waybar ];

  };


}
