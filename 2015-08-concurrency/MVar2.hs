import Control.Concurrent

thread v = putMVar v "hello" >> putMVar v "world"

main = do v <- newEmptyMVar
          forkIO $ thread v
          takeMVar v >>= putStrLn
          takeMVar v >>= putStrLn
          takeMVar v >>= putStrLn
