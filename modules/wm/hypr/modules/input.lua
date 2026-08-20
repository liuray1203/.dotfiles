-- modules/input.lua
-- 對應 input.nix

hl.config({
  input = {
    kb_layout    = "us",
    follow_mouse = 1,
    sensitivity  = 0,

    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.gesture({
  fingers   = 3,
  direction = "horizontal",
  action    = "workspace",
})

hl.device({
  name        = "epic-mouse-v1",
  sensitivity = -0.5,
})
