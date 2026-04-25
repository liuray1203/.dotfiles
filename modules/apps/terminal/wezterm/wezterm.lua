local wezterm = require 'wezterm'

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 12.0,

  color_scheme = "Catppuccin Mocha",

  front_end = "WebGpu",

  default_prog = { "/run/current-system/sw/bin/zsh" },

  keys = {
    { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
    -- 分割（更好按🔥）
    { key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical },
    { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal },

  },
}

