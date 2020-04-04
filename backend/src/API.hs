module API
    ( API
    , server
    ) where


import qualified Data.Map as M
import Servant
    ( (:<|>) (..)
    , (:>)
    )
import qualified Servant as S
import qualified Servant.RawM as SR

import qualified User as U

type API = UserAPI :<|> StaticFileAPI

server :: S.Server API
server = userServer :<|> staticFileServer

-- *****
type UserAPI
    = "api"
        :> "user"
        :> S.Get '[S.JSON] [U.User]
 :<|> "api"
        :> "user"
        :> S.Capture "uid" U.UserId
        :> S.Delete '[S.JSON] S.NoContent

userServer :: S.Server UserAPI
userServer = get :<|> delete
  where
    get :: S.Handler [U.User]
    get = pure $ M.elems U.users

    delete :: U.UserId -> S.Handler S.NoContent
    delete _ = S.throwError S.err501

-- *****
type StaticFileAPI = SR.RawM

staticFileServer :: S.Server StaticFileAPI
staticFileServer = SR.serveDirectoryFileServer "../public"
