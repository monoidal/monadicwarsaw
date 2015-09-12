import Control.Concurrent
import Control.Concurrent.Chan
import Control.Monad

main = do c <- newChan
          forkIO $ mapM_ (writeChan c) [1,2..]
          forkIO $ mapM_ (writeChan c) [-1,-2..]
          forever $ do v <- readChan c
                       print v
