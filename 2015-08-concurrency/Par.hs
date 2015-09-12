import Control.Exception
import System.Environment
import Control.Monad.Par.Scheds.Trace

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main = do
  args <- getArgs
  let [n,m] = map read args
  print $
    runPar $ do
      i <- new
      j <- new
      fork (put i (fib n))
      fork (put j (fib m))
      a <- get i
      b <- get j
      return (a+b)
