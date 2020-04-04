module Component.Index
    ( component
    ) where

import Prelude

import API as API
import Control.Monad.Except as Except
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.User as U
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.HTML as HH

type HTML m = H.ComponentHTML Action () m

data Action = Initialize | Delete U.UserId

type State =
    { users :: Maybe (Array U.User)
    }

component :: forall q o m. MonadAff m => H.Component HH.HTML q Unit o m
component =
  H.mkComponent
    { initialState: const { users: Nothing }
    , render
    , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction
      , initialize = Just Initialize
      }
    }

render :: forall m. State -> HTML m
render st =
    case st.users of
        Nothing -> HH.text "Loading..."
        Just users ->
            HH.div_
                $ renderUser <$> users

renderUser :: forall m. U.User -> HTML m
renderUser user =
    HH.div_
        [ HH.text user.name
        ]

handleAction
    :: forall o m
     . MonadAff m
    => Action
    -> H.HalogenM State Action () o m Unit
handleAction =
    case _ of
        Initialize ->
            mempty <$ H.fork do
                Except.runExceptT API.getUsers
                    >>= case _ of
                        Left _ -> pure unit
                        Right arr -> H.modify_ _{ users = Just arr }
        Delete _ -> pure unit
