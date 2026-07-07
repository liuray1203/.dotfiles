{ lib
, appimageTools
}:

appimageTools.wrapType2 rec {
  pname = "terax";
  version = "0.8.2";

  src = ./Terax_0.8.2_amd64.AppImage;

  extraInstallCommands = ''
    # 安裝 Desktop Entry
    install -Dm644 \
      ${./squashfs-root/Terax.desktop} \
      $out/share/applications/Terax.desktop

    # 安裝 Icon
    install -Dm644 \
      ${./squashfs-root/terax.png} \
      $out/share/icons/hicolor/256x256/apps/terax.png
  '';

  meta = with lib; {
    description = "AI-powered terminal";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
