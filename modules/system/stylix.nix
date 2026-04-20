{ pkgs, ... }:

{
  stylix = {
    enable = true;

    # 主題（先用穩的）
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

    # 必填（不然會報錯）
    image = ./images.jpeg

    polarity = "dark";
  };
}

