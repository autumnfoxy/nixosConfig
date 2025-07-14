{config, pkgs, lib, ...}:
{
  options = {
    waybar.enable = lib.mkEnableOption "Enables Waybar in foxyland"
  }

  config = lib.mkIf config.waybar.enable {
    environment.systemPackages = [ pkgs.waybar ];

  }


}
