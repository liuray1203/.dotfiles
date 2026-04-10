{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    curl
    wget
    ripgrep
    bat
    btop
    fastfetch
    neovim
    tree
    fzf
    zoxide
  ];
}

