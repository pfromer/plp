data Rosetree a = Tree a [Rosetree a] deriving (Eq)

foldRT::(a->[b]-> b)->Rosetree a -> b
foldRT f (Tree a l) = f a (map (foldRT f ) l)

hojas::Eq a=>Rosetree a -> [a]
hojas = foldRT (\a rec -> if rec == [] then [a] else concat rec)


distancias::Rosetree a -> [Int]
distancias = foldRT (\a rec -> if rec == [] then [0] else (map succ (concat rec)))


altura::Rosetree a -> Int
altura = foldRT (\a rec -> if rec == [] then 1 else succ (maximum rec))