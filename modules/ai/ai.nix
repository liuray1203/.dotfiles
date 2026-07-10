{ config, lib, ... }:

{
  home.file = {
    ".config/opencode/AGENTS.md".source = ./opencode.md;
  };
}
