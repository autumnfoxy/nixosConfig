# hyprland keybind variables. Includes only the MODS and key portions (without the trailing comma) but leaves the dispatcher and params portions to be defined in the config that sets the homemanager variable for that bind. It is structured this way so that the specifics of how the bind works is set in the config of the application that the bind is for (to avoid having binds for programs not installed) but the keys for the bind can be changed by going to one file instead of hunting around. The home-manager variables for hyprland specific keybinds are in Common/Hyprland/hyprbinds.nix and some keybinds that are both unlikely to change and better set by a function are contained in that file as well (for example, workspace switching).
{
  modkey = "SUPER";

  # Hyprland binds (some in hyprbinds.nix, see above comment)
  hyprland = {
    closeActive = "$mod SHIFT, C";
    exit = "$mod SHIFT, Q";
    reload = "$mod SHIFT, R";
    nextWorkspace = "$mod SHIFT, L";
    prevWorkspace = "$mod SHIFT, H";
    # Specific workspace binds defined in hyprbinds.nix, mod+1-9
    nextScreen = "$mod CTRL, J";
    prevScreen = "$mod CTRL, K";
    switchLayout = "$mod, Space";
    toggleGroup = "$mod, G";
    prevGroupActive = "$mod CTRL, H";
    nextGroupActive = "$mod CTRL, L";
    toggleFloat = "$mod SHIFT, Space";
    toggleOnTop = "$mod, T";
    nextWindow = "$mod, J";
    prevWindow = "$mod, K";
    switchScreen = "$mod, O";
    toggleMaximize = "$mod, M";
    toggleFullscreen = "$mod, F";
    swapPrev = "$mod SHIFT, K";
    swapNext = "$mod SHIFT, J";
    focusMaster = "$mod SHIFT, M";
    switchMaster = "$mod CTRL, M";
    preselectLeft = "$mod, H";
    togglePseudo = "$mod, P";
    moveToRoot = "$mod, R";
    showBinds = "$mod, S";
  };

  # Hyprlock binds
  hyprlock = {
    lock = "$mod, L";
  };

  # Kitty binds
  kitty = {
    open = "$mod, Enter";
  };

  # Waybar binds

  # Dunst binds

  # Swww binds

  # Wofi binds
  wofi = {
    open = "$mod, R";
  };

  # Librewolf binds
  librewolf = {
    open = "$mod, B";
  };

  # Misc binds
}
