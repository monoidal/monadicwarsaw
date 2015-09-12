fact, fact2, fact3 :: Int -> Int
helper :: (Int -> Int) -> Int -> Int


fact n = if n == 0 then 1 else n * fact (n-1)

helper g n = if n == 0 then 1 else n * g (n-1)
fact2 = helper fact2

fix :: (a -> a) -> a
fix f = f (fix f)

fact3 = fix helper
