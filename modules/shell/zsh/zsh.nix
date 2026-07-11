{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        la = "ls -a";
        rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";
      };

      initContent = ''
        export PATH=$HOME/.npm-global/bin:$PATH

        eval "$(starship init zsh)"
        eval "$(zoxide init zsh)"

        export PATH="$HOME/.opencode/bin:$PATH"

        # 將 autosuggestion 接受從右方向鍵改為 Alt+F
        ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
        bindkey '\ef' autosuggest-accept
      '';
    };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
