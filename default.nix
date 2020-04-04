let
  sources = import ./nix/sources.nix;
  overlay = _: pkgs: { niv = import sources."niv" {}; };

  pkgs = import sources.nixpkgs {
    overlays = [ overlay ];
    config = {};
  };

  easy-purescript-nix = import sources.easy-purescript-nix { inherit pkgs; };

  self = {
    inherit pkgs easy-purescript-nix;
    inherit (pkgs) niv;
  };

  in
    self
