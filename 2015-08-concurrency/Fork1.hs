import System.IO
import Control.Concurrent (forkIO)

infinite :: Char -> IO ()
infinite x = putStrLn (repeat x)

-- forkIO :: IO () -> IO ThreadId
main = do hSetBuffering stdout NoBuffering
          forkIO (infinite 'a')
          forkIO (infinite 'b')
          forkIO (infinite 'c')
          getLine
