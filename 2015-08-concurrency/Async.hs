import GetURL
import Control.Concurrent.Async
import Data.ByteString as BS

main = do a <- async (getURL "http://www.google.com")
          b <- async (getURL "http://www.bing.com")
          c <- waitEither a b
          print (either BS.length BS.length c)
          d <- mapConcurrently getURL ["http://www.haskell.org", "http://hackage.haskell.org"]
          print d
