local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Noto Sans CJK TC",
  }),

  font_size = 12.0,
  line_height = 1.0,

  color_scheme = "Gruvbox Dark",

  window_background_opacity = 0.85,

  front_end = "OpenGL",

  default_prog = { "/run/current-system/sw/bin/zsh" },

  keys = {
    { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },

    { key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical },
    { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal },
  },
}
