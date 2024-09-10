{
  stdenv,
  lib,
  fetchurl,
  makeWrapper,
  bash,
  coreutils,
}:
stdenv.mkDerivation rec {
  name = "ani-skip";

  meta = with lib; {
    description = "skip intros in anime mpv";
    homepage = https://github.com/synacktraa/ani-skip;
    license = licenses.gpl3;
    maintainers = with maintainers; [synacktraa];
    platforms = platforms.all;
  };

  src = fetchurl {
    url = https://github.com/synacktraa/ani-skip/archive/refs/tags/1.0.1.tar.gz;
    sha256 = "69a062e52962508178d95b8e3ab66bf4bcd7586727f1c420032161b42fa5c35f";
  };

  buildInputs = [bash makeWrapper];

  installPhase = ''
    # install

    mkdir -p $out/bin
    cp ani-skip $out/bin/ani-skip
    wrapProgram $out/bin/ani-skip \
           --prefix PATH : ${lib.makeBinPath [bash]}
  '';
}
