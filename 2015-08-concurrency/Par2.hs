import Control.Exception
import System.Environment
import Control.Monad.Par.Scheds.Trace
import Control.Monad

fib :: Integer -> Par Integer
fib 0 = return 1
fib 1 = return 1
fib n = do i <- new
           j <- new
           fork (fib (n-1) >>= put i)
           fork (fib (n-2) >>= put j)
           liftM2 (+) (get i) (get j)

main = do
  [arg] <- getArgs
  print $ runPar $ fib $ read arg
