import Prelude hiding (map)

data Day = Mo | Tu | We | Th | Fr | Sa | Su

weekend :: [Day]
weekend = [Fr, Sa, Su]

data Name = Name String String

name :: Name
name = Name "Jan" "Kowalski"

data IntList = Nil | Cons Int IntList

list :: IntList
list = Cons 4 $ Cons 10 $ Cons 3 Nil

data List a = Nil' | Cons' a (List a)

list2 :: List Bool
list2 = Cons' True $ Cons' False Nil'

-- Exercise: implement map, filter, foldr, unfoldr.
-- map :: (a -> b) -> List a -> List b
-- filter :: (a -> Bool) -> List a -> List a
-- foldr :: (b -> a -> a) -> a -> List b -> a
-- unfoldr :: (a -> Maybe (a,b)) -> b -> List a

-- Q: what can M contain?
data M a = End a | More (M (a,a))

mVal :: M Int
mVal = More (End (1,2))


-- Functions in types
-- Abridged from http://stackoverflow.com/questions/5792769
data Multi = Return Int | Consume (Int -> Multi)

sum3 :: Multi
sum3 = Consume $ \x -> Consume $ \y -> Consume $ \z -> Return (x+y+z)

sumStream :: Multi
sumStream = Consume (go 0)
    where
    go accum 0 = Return accum
    go accum n = Consume (\x -> go (accum+x) (n-1))

-- Q: define
--apply :: Multi -> [Int] -> Maybe Int
--apply = _

