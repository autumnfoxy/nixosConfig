{config, pkgs, lib, ...}:
{
  imports = [
    ../kitty.nix
    ../waybar.nix
    ../hyprlock.nix
    ../librewolf.nix
  ];

  options = {
    foxyland.enable = lib.mkEnableOption "Enables FoxyLand config for Hyprland";
  };

  config = lib.mkIf config.foxyland.enable {
    environment.systemPackages = [
      pkgs.dunst
      pkgs.libnotify
      pkgs.swww
      pkgs.wofi
    ];
    waybar.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;

    hyprlock.defaultConfig = lib.mkDefault true;
  };
}
