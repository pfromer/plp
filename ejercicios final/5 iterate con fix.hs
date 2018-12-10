myIterate::(a->a)->a->[a]
myIterate f a = fix (\x -> a:(map f x))

fix::(a->a)->a
fix = (\f->f (fix f))

{-|

creo que la razon por la cual esto funciona en haskell y no en lambda calculo es porque en haskell 
hay lazy evaluation

copio abajo como reduce lo de arriba

myIterate (+1) =
fix (\x -> 1:(map (+1) x)) =
(\f->f (fix f)) (\x -> 1:(map (+1) x)) =
(\x -> 1:(map (+1) x)) (fix (\x -> 1:(map (+1) x))) =
1:(map (+1) (fix (\x -> 1:(map (+1) x)))) =
.
.
1:(map (+1) (1:(map (+1) (fix (\x -> 1:(map (+1) x))))))= 
1:(2:( map(+1) (map (+1) (fix (\x -> 1:(map (+1) x))))))=
.
.
.
-}  