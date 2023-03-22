{ pkgs ? import <nixpkgs> {} }:

let
  version = "2.12";
  url = "https://ftp.gnu.org/gnu/hello";
in
pkgs.stdenv.mkDerivation {
  name = "hello-${version}";
  src = pkgs.fetchurl {
    url = "${url}/hello-${version}.tar.gz";
    sha256 = "1ayhp9v4m4rdhjmnl2bq3cibrbqqkgjbl3s7yk2nhlh8vj3ay16g";
  };
  doCheck = true;
}
