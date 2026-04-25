local wezterm = require 'wezterm'

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 14.0,

  color_scheme = "Catppuccin Mocha",

  front_end = "WebGpu",

  default_prog = { "/run/current-system/sw/bin/zsh" },

  keys = {
    { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
  },
}

