{ lib
, appimageTools
}:

appimageTools.wrapType2 rec {
  pname = "terax";
  version = "0.8.2";

  src = ./Terax_0.8.2_amd64.AppImage;

  meta = with lib; {
    description = "AI-powered terminal";
    platforms = platforms.linux;
    license = licenses.unfree;
  };
}
