# Instructions source: https://docs.google.com/drawings/d/1CvUhZVp3JUQxCqOORCE3NYfPC138JZQWqdaIrx3zTKE/edit?usp=sharing
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:

    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          espflash
        ];
      };
    });
}
