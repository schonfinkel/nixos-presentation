{
  description = "Development shell";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        texenv = pkgs.texlive.combine {
          inherit (pkgs.texlive)
          beamer
          collection-basic
          collection-fontsextra
          collection-fontsrecommended
          collection-langenglish
          collection-langportuguese
          collection-latex
          collection-latexextra
          collection-mathscience
          enumitem
          fancyhdr
          hyphen-portuguese
          latexmk
          textcase
          scheme-medium
          ;
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            texenv
          ];
        };
      }
    );
}
