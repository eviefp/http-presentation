{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "affjax"
  , "console"
  , "effect"
  , "errors"
  , "generics-rep"
  , "halogen"
  , "maybe"
  , "newtype"
  , "ordered-collections"
  , "profunctor-lenses"
  , "record"
  , "simple-json"
  , "sized-vectors"
  , "strings"
  , "strings-extra"
  , "stringutils"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
