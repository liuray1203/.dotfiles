{ ... }:

let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "hyprlauncher";
in
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      # apps
      "$mainMod, RETURN, exec, ${terminal}"
      "$mainMod, Q, killactive"
      "$mainMod, M, exec, sh -c 'command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit'"
      "$mainMod, E, exec, ${fileManager}"
      "$mainMod, SPACE, exec, ${menu}"
      "$mainMod, W, exec, warp-terminal"

      # window behavior
      "$mainMod, V, togglefloating"
      "$mainMod, P, pseudo"

      # screenshot
      ", PRINT, exec, hyprshot -m window"
      "SHIFT, PRINT, exec, hyprshot -m region"

      # lock
      "$mainMod SHIFT, L, exec, hyprlock"

      # focus
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # workspace
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"

      # special workspace
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # scroll workspace
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}

