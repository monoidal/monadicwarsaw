{-# LANGUAGE EmptyCase #-}
data Void
data Expr v = Const Int | Var v | Add (Expr v) (Expr v)

subst :: (v -> Expr w) -> Expr v -> Expr w
subst f (Const k) = Const k
subst f (Var v) = f v
subst f (Add x y) = Add (subst f x) (subst f y)

eval :: Expr Void -> Int
eval (Const k) = k
eval (Var v) = case v of {}
eval (Add x y) = eval x + eval y

m = eval $ subst k (Add (Var "x") (Var "y"))
    where k "x" = Const 5
          k "y" = Const 10
