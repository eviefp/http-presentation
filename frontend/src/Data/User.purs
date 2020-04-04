module Data.User
    ( User (..)
    , UserId (..)
    ) where

import Prelude

import Data.Newtype (class Newtype)
import Simple.JSON as JSON

type User =
    { userId :: UserId
    , name   :: String
    }

newtype UserId = UserId Int

derive instance newtypeUserId :: Newtype UserId _
derive newtype instance readForeignUserId :: JSON.ReadForeign UserId
derive newtype instance showUserId :: Show UserId
