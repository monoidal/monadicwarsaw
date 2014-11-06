{-# LANGUAGE DeriveFunctor #-}
data Unary = A (Maybe Unary)

a :: Unary
a = A $ Just $ A Nothing

--   fix f =     f (fix f)
data Fix f = In (f (Fix f))
a' :: Fix Maybe
a' = In $ Just $ In $ Just $ In Nothing


data IntList = Nil | Cons Int IntList

l :: IntList
l = Cons 4 $ Cons 2 Nil

data Helper a = Nil' | Cons' Int a deriving Functor

nil = In Nil'
cons x y = In (Cons' x y)

l' :: Fix Helper
l' = cons 4 $ cons 2 nil


fold :: Functor f => (f a -> a) -> Fix f -> a
fold f (In x) = f (fmap (fold f) x)

-- sum l'
s = fold t l'
  where t Nil' = 0
        t (Cons' x y) = x + y
