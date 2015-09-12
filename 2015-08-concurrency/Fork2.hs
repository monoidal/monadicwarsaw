import System.IO
import Control.Concurrent (forkIO, killThread)

infinite :: Char -> IO ()
infinite x = putStrLn (repeat x)

main = do hSetBuffering stdout NoBuffering
          a <- forkIO (infinite 'a')
          b <- forkIO (infinite 'b')
          _ <- forkIO (infinite 'c')
          getLine
          killThread a
          getLine
          killThread b
          getLine
