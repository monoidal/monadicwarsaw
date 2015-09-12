import Control.Concurrent
import System.Environment
import Data.Char (isUpper)
import Control.Exception (ErrorCall(..))
import qualified Data.Map as Map

th :: String -> IO ()
th str = threadDelay 500000 >> putStrLn str >> th str

type State = Map.Map String ThreadId

processCmd :: String -> State -> IO State
processCmd c m = case Map.lookup c m of
                   Nothing -> do tid <- forkIO $ th c
                                 return (Map.insert c tid m)
                   Just x -> do throwTo x (ErrorCall "cancelled")
                                return (Map.delete c m)

main :: IO ()
main = go Map.empty
  where go m = do x <- getLine
                  m' <- processCmd x m
                  go m'
