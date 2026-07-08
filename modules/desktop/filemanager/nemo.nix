{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo
    papirus-icon-theme
  ];

   gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
    };
  };
}
