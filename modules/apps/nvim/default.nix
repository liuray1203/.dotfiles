{ config, lib, ... }:

{
  home.file.".config/nvim" = {
    source = lib.cleanSource ./.;
  };
}
