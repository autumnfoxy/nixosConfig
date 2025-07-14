let
  keybinds = import ./keybinds.nix;
in{config, pkgs, lib, ...}:
{
  options = {
    kitty.enable = lib.mkEnableOption "Enables Kitty + Config";
  };

  config = lib.mkIf config.kitty.enable {
    environment.systemPackages = [
      pkgs.kitty
      pkgs.gtk3
    ];
    home-manager.users.slimelord = {
      programs.kitty.enable = true;
      wayland.windowManager.hyprland.settings.bindd = [ "${keybinds.kitty.open}, Opens Kitty, exec, uwsm app -- kitty" ];
    };
  };
}
