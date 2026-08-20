-- modules/windowrules.lua
-- 對應 windowrules.nix：讓 Spotify 固定開在工作區 6 並自動最大化

hl.window_rule({
  name  = "spotify-workspace",
  match = { class = "^(spotify)$" },

  workspace = 6,
})

hl.window_rule({
  name  = "spotify-maximize",
  match = { class = "^(spotify)$" },

  maximize = true,
})
