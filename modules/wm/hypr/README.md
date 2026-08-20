# Hyprland Lua 設定（從 Nix/hyprlang 轉回原生 Lua）

## 這份是什麼

把你上傳的 `modules/wm/hypr/*.nix`（home-manager，用 `settings =` 產生舊版
hyprlang 語法）內容，轉換成 Hyprland 0.55 原生的 Lua 設定格式，
讓你不透過 NixOS，直接把這些檔案放到 `~/.config/hypr/` 也能得到一樣的行為。

## 檔案結構

```
hypr-lua-v2/
├── init.lua               # 入口檔，載入 colors 後依序載入其他模組
├── hyprlock.conf           # 對應 hyprlock.nix，獨立於 hl.* 系統之外
└── modules/
    ├── colors.lua          # 對應 colors.nix (Catppuccin Mocha 色票)
    ├── autostart.lua       # 對應 default.nix 的 exec-once / env
    ├── monitor.lua         # 對應 default.nix 的 monitor
    ├── appearance.lua      # 對應 appearance.nix
    ├── animations.lua      # 對應 animations.nix
    ├── input.lua           # 對應 input.nix
    ├── keybinds.lua        # 對應 keybinds.nix 的 bind[] / bindm[]
    ├── mediakeys.lua       # 對應 keybinds.nix 的 bindel[] / bindl[]
    └── windowrules.lua     # 對應 windowrules.nix (Spotify 規則)
```

## 沒有轉換的部分，及原因

- **`package.nix`（`kitty` / `hyprlock` / `hyprshot` / `awww` /
  `brightnessctl` / `waybar`）**：這是 Nix 在幫你「安裝套件」，屬於
  系統/套件管理層級，不是 Hyprland 設定檔管得到的範圍。換到非 NixOS
  系統時，請自行用你的套件管理器（`pacman -S ...`、`apt install ...`
  等）把這幾個程式裝好。
- **`hyprlock.conf`**：hyprlock 是獨立於 Hyprland 主程式之外的鎖屏
  工具，用的是自己的設定格式，不受 Hyprland 0.55 把主設定改成 Lua
  的影響。這裡維持它原本的語法，只是把 Nix 的 `${colors.xxx}` 字串
  內插換成寫死的色碼（Catppuccin Mocha）。

## 使用方式

把 `init.lua`、`modules/` 放進 `~/.config/hypr/`，`hyprlock.conf` 也放進
`~/.config/hypr/hyprlock.conf`。之後 Hyprland 啟動時載入 `init.lua`
即可（實際入口檔名請以你目前 Hyprland 版本的文件/`hyprctl` 說明為準，
0.55 剛推出 Lua 設定不久，我沒能查到官方寫死的入口檔名，`init.lua`
是延用你原本那份檔案慣用的命名）。

## 重複的亮度快捷鍵

`keybinds.lua` 裡的 `XF86MonBrightnessUp/Down`（無 locked/repeating）
跟 `mediakeys.lua` 裡的同一組鍵（有 locked/repeating）是刻意重複的——
因為原本上傳的 `keybinds.nix` 裡，`bind` 跟 `bindel` 兩個列表也各寫了
一次一模一樣的按鍵。這裡照原樣保留，但這種重複通常只有其中一個會真的
生效，如果實際測試發現亮度快捷鍵行為怪怪的，建議直接刪掉
`keybinds.lua` 裡沒有 locked/repeating 的那兩行，只留
`mediakeys.lua` 裡的版本。

## 關於 hl.* API 本身

`hl.config()` / `hl.bind()` / `hl.window_rule()` 這套 API 是 Hyprland
0.55 才推出的原生 Lua 設定介面，非常新（我的知識庫更新到 2026 年 1 月，
這是之後才出的）。這裡的函式呼叫方式是照你最早提供的那份範例檔案的
風格延伸寫的，建議你在實際套用前，對照 Hyprland 官方 wiki 的 Lua API
文件，確認每個函式的確切參數名稱與行為是否一致。
