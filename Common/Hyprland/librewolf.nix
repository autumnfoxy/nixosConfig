let
  keybinds = import ./keybinds.nix;
in{config, pkgs, lib, ...}:
{
  imports = [];

  options = {
    librewolf.enable = lib.mkEnableOption "Enables librewolf & default configuration";
  };

  config = lib.mkIf config.librewolf.enable {
    environment.systemPackages = [ pkgs.librewolf ];
    home-manager.users.slimelord = {
      programs.librewolf = {
        enable = true;
        # settings = {};
      };
      wayland.windowManager.hyprland.settings = {
        bindd = [ "${keybinds.librewolf.open}, Opens Librewolf, exec, uwsm app -- librewolf" ];
      };
    };
  };
}
