{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    image = ../../images.jpeg; 
    polarity = "dark";
  };

  stylix.targets.gnome.enable = false;
  stylix.targets.gtk.enable = true;
  stylix.targets.qt.enable = false;
}
