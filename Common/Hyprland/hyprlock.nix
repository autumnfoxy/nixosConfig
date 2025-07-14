let
  keybinds = import ./keybinds.nix;
in{pkgs, config, lib, ...}:
{
  imports = [];
  options = {
    hyprlock.enable = lib.mkEnableOption "Enables hyprlock";
    hyprlock.defaultConfig = lib.mkEnableOption "Enables the default config for hyprlock";
  };

  config = lib.mkIf config.hyprlock.enable {
    security.pam.services.hyprlock = {};
    programs.hyprlock.enable = true;

    home-manager.users.slimelord = lib.mkIf config.hyprlock.defaultConfig {
      wayland.windowManager.hyprland.settings = {
        bindd = [
          "${keybinds.hyprlock.lock}, Lock with hyprlock, exec, uwsm app -- hyprlock"
        ];
      };
      programs.hyprlock = {
        enable = true;
        settings = {
          background = [
            {
              path = "screenshot";
              blur_passes = 4;
              blur_size = 10;
            }
          ];
        };
      };
    };
  };
}
