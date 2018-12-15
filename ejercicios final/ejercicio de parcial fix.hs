fix::(a->a)->a
fix = (\f->f (fix f))

f::(Int->[Int])->Int->[Int]
f a b = b:(a (-b))

{-|



fix f 1
f (fix f) 1
f (f (fix f)) 1 = 
1:((f (fix f)) (-1) ) =
1:(-1:fix f -(-1))
1:(-1:fix f 1))
1:-1:fix f 1
.
.
.


tener en cuenta que si f::(Int->[Int])->Int->[Int]
entonces fix f::Int->[Int]

por lo tanto "f (fix f) 1" tipa correctamente a [Int]

-}  