-- Okasaki, From fast exponentiation to square matrices: an adventure in types
type Vector a = Vector_ () a

data Vector_ v w = Zero v | Even (Vector_ v (w,w)) | Odd (Vector_ (v,w) (w,w))

five = Odd $ Even $ Odd $ Zero (((),1),((2,3),(4,5)))
