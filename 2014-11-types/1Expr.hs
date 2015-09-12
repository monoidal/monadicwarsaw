data Expr = Const Int | Var String | Add Expr Expr

eval :: (String -> Int) -> Expr -> Int
eval f (Const k) = k
eval f (Var x) = f x
eval f (Add x y) = eval f x + eval f y

m = eval k (Add (Var "x") (Var "y"))
    where k "x" = 5
          k "y" = 10
