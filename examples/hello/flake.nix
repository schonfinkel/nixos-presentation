{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      version = "2.12";
      url = "https://ftp.gnu.org/gnu/hello";
    in {
      packages.x86_64-linux.hello =
        pkgs.stdenv.mkDerivation {
          name = "hello";
          src = pkgs.fetchurl {
            url = "${url}/hello-${version}.tar.gz";
            sha256 = "1ayhp9v4m4rdhjmnl2bq3cibrbqqkgjbl3s7yk2nhlh8vj3ay16g";
          };
        };

      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

      doCheck = true;
    };
}
