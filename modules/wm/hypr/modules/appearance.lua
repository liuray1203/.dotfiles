-- modules/appearance.lua
-- 對應 appearance.nix，邊框顏色用 colors.lua 的主題色組合而成

hl.config({
  general = {
    gaps_in     = 1,
    gaps_out    = 1,
    border_size = 2,
    layout      = "dwindle",

    col = {
      active_border   = {
        colors = { "rgba(" .. colors.base0D .. "ff)", "rgba(" .. colors.base0E .. "ff)" },
        angle  = 45,
      },
      inactive_border = "rgba(" .. colors.base02 .. "aa)",
    },
  },

  decoration = {
    rounding       = 10,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = "rgba(1a1a1aee)",
    },

    blur = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },
})
