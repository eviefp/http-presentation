module Main
    ( main
    ) where

import Data.Proxy
    ( Proxy (..)
    )
import Network.Wai.Handler.Warp
    ( run
    )
import Servant
    ( serve
    )

import API

api :: Proxy API
api = Proxy

main :: IO ()
main = run 8080 $ serve api server
