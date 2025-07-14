# Default User(s)

{ config, pkgs, ... }:

{
  imports = [];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.slimelord = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}

