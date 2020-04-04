module User
    ( User (..)
    , UserId (..)
    , users
    ) where

import qualified Data.Aeson as Aeson
import Data.Map
    ( Map
    )
import qualified Data.Map as M
import Data.Text
    ( Text
    )
import qualified GHC.Generics as G
import qualified Servant as S

data User = User
    { userId :: UserId
    , name   :: Text
    }
    deriving stock (G.Generic)
    deriving anyclass (Aeson.ToJSON, Aeson.FromJSON)

newtype UserId = UserId
    { getUserId :: Int
    }
    deriving stock (G.Generic, Eq, Ord)
    deriving newtype (Aeson.ToJSON, Aeson.FromJSON, S.FromHttpApiData)

users :: Map UserId User
users =
    M.fromList
        $ go <$>
            [ (1, "One")
            , (2, "Two")
            , (3, "Three")
            , (4, "Four")
            ]
  where
    go (a, b) =
        let uid = UserId a
        in (uid, User uid b)
