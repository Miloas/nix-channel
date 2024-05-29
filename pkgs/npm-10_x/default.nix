# This file was autogenerated. Edit the update.ts file instead.
{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "npm";
  version = "10.8.0";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/npm/-/npm-10.8.0.tgz";
    sha512 = "wh93uRczgp7HDnPMiLXcCkv2hagdJS0zJ9KT/31d0FoXP02+qgN2AOwpaW85fxRWkinl2rELfPw+CjBXW48/jQ==";
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