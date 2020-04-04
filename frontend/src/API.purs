module API
    ( getUsers
    , deleteUser
    ) where

import Prelude

import Affjax as Affjax
import Affjax.ResponseFormat as RF
import Control.Monad.Except (ExceptT(..), throwError)
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.User as U
import Effect.Aff.Class (class MonadAff, liftAff)
import Simple.JSON as JSON

getUsers :: forall m. MonadAff m => ExceptT Unit m (Array U.User)
getUsers = do
    res <-
        ExceptT
            $ lmap (const unit)
                <$> liftAff (Affjax.get RF.string "/api/user")
    case JSON.readJSON res.body of
        Right arr -> pure arr
        Left _  -> throwError unit

deleteUser :: forall m. MonadAff m => U.UserId -> ExceptT Unit m Unit
deleteUser uid =
    ExceptT
        $ lmap (const unit)
            <$> liftAff (Affjax.delete_ $ "/api/user/" <> show uid)

