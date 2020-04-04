module Main where

import Effect (Effect)
import Halogen.VDom.Driver (runUI)
import Prelude (Unit, bind, unit)

import Component.Index as Index
import Halogen.Aff as HA

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI Index.component unit body
