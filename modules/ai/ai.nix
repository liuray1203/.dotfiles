{ config, lib, ... }:

{
  home.file = {
    ".config/opencode/AGENTS.md".source = ./ai/opencode.md;
  };
}
