# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "npm";
  version = "10.8.2";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/npm/-/npm-10.8.2.tgz";
    sha512 = "x/AIjFIKRllrhcb48dqUNAAZl0ig9+qMuN91RpZo3Cb2+zuibfh+KISl6+kVVyktDz230JKc208UkQwwMqyB+w==";
  };
  doCheck = true;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir $out
    cp -r * $out
    chmod +x $out/bin/{npm,npx,node-gyp-bin/node-gyp}
  '';
  meta.priority = "100"; # Prevents collision with Node's built-in npm
}
