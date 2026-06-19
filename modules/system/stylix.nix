{ pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

    image = ../../images.jpeg;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  stylix.targets.gnome.enable = false;
  stylix.targets.gtk.enable = true;
  stylix.targets.qt.enable = false;
}
