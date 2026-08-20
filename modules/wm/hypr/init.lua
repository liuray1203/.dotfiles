-- init.lua
-- 主入口：先載入顏色定義成全域變數，再依序載入各模組
-- 對應原本 Nix 版本的 modules/wm/hypr/default.nix + 各個 .nix 檔

local function scriptDir()
  local src = debug.getinfo(1, "S").source:sub(2)
  return src:match("(.*/)") or "./"
end

local dir = scriptDir()

-- 顏色主題設為全域變數，讓其他模組可以直接取用 colors.xxx
-- (對應原本 colors.nix 被 appearance.nix / hyprlock.nix import 的用法)
colors = dofile(dir .. "modules/colors.lua")

dofile(dir .. "modules/autostart.lua")   -- 對應 default.nix 的 exec-once / env
dofile(dir .. "modules/monitor.lua")     -- 螢幕輸出設定
dofile(dir .. "modules/appearance.lua")  -- 對應 appearance.nix
dofile(dir .. "modules/animations.lua")  -- 對應 animations.nix
dofile(dir .. "modules/input.lua")       -- 對應 input.nix
dofile(dir .. "modules/keybinds.lua")    -- 對應 keybinds.nix 的 bind / bindm
dofile(dir .. "modules/mediakeys.lua")   -- 對應 keybinds.nix 的 bindel / bindl
dofile(dir .. "modules/windowrules.lua") -- 對應 windowrules.nix
