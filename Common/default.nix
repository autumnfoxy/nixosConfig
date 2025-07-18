{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./locales.nix
      ./system.nix
      ./users.nix
      ./Hyprland/hyprland.nix
      ./vim.nix
    ];
  environment.systemPackages = [
    pkgs.git
    pkgs.gh
  ];
  hyprland.enable = lib.mkDefault true;
  vim.enable = lib.mkDefault true;
}


