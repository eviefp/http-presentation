let
  inherit (import ../.) pkgs easy-purescript-nix;
  inherit (easy-purescript-nix) purs spago pscid;
in
  pkgs.mkShell {
    buildInputs = [ purs spago pscid ];
  }
