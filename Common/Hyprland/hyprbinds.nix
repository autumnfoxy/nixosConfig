let
  keybinds = import ./keybinds.nix;
in{config, pkgs, lib, ...}:
{
  imports = [];
  options = {
    hyprbinds.enable = lib.mkEnableOption "Enables Default Hyprland Binds";
  };

  config = lib.mkIf config.hyprbinds.enable {
    home-manager.users.slimelord = {pkgs, ...}: {
      home.packages = [ (pkgs.writeShellScriptBin "hyprswitchlayouts" ''
        if [ $(hyprctl getoption general:layout) = dwindle ]; then
          hyprctl keyword general:layout master
        else
          hyprctl keyword general:layout dwindle
        fi
      '') ];
      wayland.windowManager.hyprland.settings = {
        "$mod" = keybinds.modkey;
        bindd = [
          "${keybinds.hyprland.closeActive}, Closes the active window, killactive"
          "${keybinds.hyprland.exit}, Exit Hyprland, exec, uwsm stop"
          "${keybinds.hyprland.reload}, Reload hyprland, exec, uwsm app -- hyprctl reload"
          "${keybinds.hyprland.nextWorkspace}, Switch to next workspace, workspace, +1"
          "${keybinds.hyprland.prevWorkspace}, Switch to previous workspace, workspace, -1"
          "${keybinds.hyprland.nextScreen}, Switch to next screen, focusmonitor, +1"
          "${keybinds.hyprland.prevScreen}, Switch to previous screen, focusmonitor, -1"
          "${keybinds.hyprland.switchLayout}, Switch layouts, exec, uwsm app -- hyprswitchlayouts"
          "${keybinds.hyprland.toggleGroup}, Toggles window group, togglegroup"
          "${keybinds.hyprland.nextGroupActive}, Switch to the next window in group, changegroupactive, f"
          "${keybinds.hyprland.prevGroupActive}, Switch to the previous window in group, changegroupactive, b"
          "${keybinds.hyprland.toggleFloat}, Toggles float for the active window, togglefloating"
          "${keybinds.hyprland.toggleOnTop}, Toggles whether the active window is pinned, pin"
          "${keybinds.hyprland.nextWindow}, Switch to next window, cyclenext"
          "${keybinds.hyprland.prevWindow}, Switch to previous window, cyclenext, prev"
          "${keybinds.hyprland.switchScreen}, Switch active window to different screen, movewindow, mon:+1"
          "${keybinds.hyprland.toggleMaximize}, Toggles whether a window is maximized, fullscreen, 1"
          "${keybinds.hyprland.toggleFullscreen}, Toggles whether a window is fullscreen, fullscreen, 0"
          "${keybinds.hyprland.swapPrev}, Swap with previous window, swapnext, prev"
          "${keybinds.hyprland.swapNext}, Swap with next window, swapnext"
          "${keybinds.hyprland.focusMaster}, Focuses the master in master layout, layoutmsg, focusmaster auto"
          "${keybinds.hyprland.switchMaster}, Switches the master in master layout, layoutmsg, swapwithmaster auto"
          "${keybinds.hyprland.preselectLeft}, Open the next window left in Dwindle layout, layoutmsg, preselect l"
          "${keybinds.hyprland.togglePseudo}, Toggles pseudotiling in Dwindle layout for floating windows, pseudo"
          "${keybinds.hyprland.moveToRoot}, Move current window to root of current tree, layoutmsg, movetoroot"
          "${keybinds.hyprland.showBinds}, Show current keybinds, exec, uwsm app -- kitty \"hyprctl binds | less\""
        ]
        ++ (
          #binds the workspace keybinds
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, Go to workspace ${toString ws}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, Move active to workspace ${toString ws}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
        );
      };
    };
  };
}
