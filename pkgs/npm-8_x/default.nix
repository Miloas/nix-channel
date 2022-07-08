{pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem}:

pkgs.stdenv.mkDerivation rec {
  name = "npm";
  version = "8.13.2";
  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/${name}/-/${name}-${version}.tgz";
    sha512 = "aS6q/QKxkw9mTX8gR7Ft38BcRkW1i+h3sI1yAFmfQ30Yl1a1G4ZX3oNGDzaLCilU5ThFZQBS1F4ZSZsrVxJ7HA==";
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