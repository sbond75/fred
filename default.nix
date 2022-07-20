{ lib, stdenv, fetchurl, libsForQt5, which, callPackage }:

stdenv.mkDerivation rec {
  pname = "fred";
  version = "0.2.0";

  src = fetchurl {
    url = "https://files.pinguin.lu/${pname}-${version}.tar.gz";
    sha256 = "ca6a51d115a1168f7d768e2058d297f4288cce7e554749476cea6e176959561f";
  };

  buildInputs = [
    which
  ];

  nativeBuildInputs = [
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.wrapQtAppsHook
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.qtscript

    (callPackage ../../bcd/hivex.nix {})
  ];

  patchPhase = ''
    patchShebangs autogen.sh
    substituteInPlace autogen.sh --replace "-qt=qt5" "" #--replace 'make -j$OPT_JOBS release || exit 1' 'make -C "/build/${pname}-${version}" -j$OPT_JOBS release || exit 1'
  '';
  
  buildPhase = ''
    ls -la /build/${pname}-${version}
    ls -la 
    ./autogen.sh --platform=linux
    #ls -la
    #cat Makefile
    make -j$NIX_BUILD_CORES all
  '';

  installPhase = ''
    mkdir "$out"
    mkdir "$out/bin"
    install -Dm755 fred $out/bin
  '';
}
  
