{ pkgs ? import <nixpkgs> {} }:

let
  version = "2.12";
in
pkgs.stdenv.mkDerivation {
  name = "hello-${version}";
  src = pkgs.fetchurl {
    url = "https://mirror.cedia.org.ec/gnu/hello/hello-${version}.tar.gz";
    sha256 = "1ayhp9v4m4rdhjmnl2bq3cibrbqqkgjbl3s7yk2nhlh8vj3ay16g";
  };
  doCheck = true;
}
