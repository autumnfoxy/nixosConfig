{pkgs, lib, config, ...}:
{
  imports = [
    ./FoxyLand/foxyland.nix
    ./hyprbinds.nix
  ];
  options = {
    hyprland.enable = lib.mkEnableOption "Enables Hyprland";
  }; 

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    home-manager.users.slimelord = {pkgs, ...}: {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
      };
    };


    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    foxyland.enable = lib.mkDefault true;
    hyprbinds.enable = lib.mkDefault true;

  };
  
}
