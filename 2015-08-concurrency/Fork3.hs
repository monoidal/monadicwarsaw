import Control.Concurrent
import Control.Exception
import System.IO

main = do hSetBuffering stdout NoBuffering
          a <- forkIO $ putStr (repeat 'a') `catch` (\ThreadKilled -> putStr (repeat 'b'))
          getLine
          killThread a
          getLine
