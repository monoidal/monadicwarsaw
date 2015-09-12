import Control.Concurrent.STM
import Control.Monad
import Control.Concurrent

checkBalance :: [TVar Int] -> IO ()
checkBalance v = forever $ do
                   x <- atomically $ mapM readTVar v
                   when (sum x /= 0) $ putStrLn "error"

transact :: TVar Int -> TVar Int -> IO ()
transact v1 v2 = forever $ do
                   atomically $ modifyTVar v1 (subtract 1)
                   atomically $ modifyTVar v2 (+ 1)

main = do v <- replicateM 2 (newTVarIO 0)
          x <- forkIO (checkBalance v)
          let [v1, v2] = v
          a <- forkIO (transact v1 v2)
          getLine
