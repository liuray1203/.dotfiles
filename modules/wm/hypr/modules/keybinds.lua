-- modules/keybinds.lua
-- 對應 keybinds.nix 的 bind[] 與 bindm[]
-- $mainMod = Alt, $otherMod = SUPER

local terminal    = "wezterm"
local fileManager = "nemo"
local menu        = "fuzzel"

local mainMod     = "ALT"
local otherMod    = "SUPER"

-- 應用程式
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("sh -c 'command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("kitty"))

-- 重啟 waybar / fcitx5
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill waybar; waybar &"))
hl.bind(otherMod .. " + f", hl.dsp.exec_cmd("pkill fcitx5; fcitx5 &"))

-- 截圖
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

-- 鎖屏
hl.bind(otherMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- 焦點移動
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- 工作區切換 / 移動視窗到工作區 (1~6)
for i = 1, 6 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(otherMod .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- 特殊工作區 (magic)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- 滑鼠滾輪切換工作區
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- 亮度 (無修飾鍵版本；下面 mediakeys.lua 另外還有帶 locked/repeating 的版本，
-- 兩者都保留是因為原本 nix 設定裡也重複寫了兩次)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- 滑鼠拖曳 / 縮放視窗
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
