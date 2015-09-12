import Control.Concurrent
import Control.Exception
import System.IO

main = do hSetBuffering stdout NoBuffering
          a <- forkIO $ putStr (repeat 'a') `finally` putStrLn "end"
          getLine
          killThread a
          getLine
