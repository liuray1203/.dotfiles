{ lib
, appimageTools
}:

appimageTools.wrapType2 rec {
  pname = "terax";
  version = "0.8.2";

  src = ./Terax_0.8.2_amd64.AppImage;

  extraInstallCommands = ''
    install -Dm644 \
      ${./Terax.desktop} \
      $out/share/applications/Terax.desktop

    install -Dm644 \
      ${./terax.png} \
      $out/share/icons/hicolor/256x256/apps/terax.png
  '';

  meta = with lib; {
    description = "AI-powered terminal";
    platforms = platforms.linux;
    license = licenses.unfree;
  };
}
