data AB a = Nil | Bin (AB a) a (AB a) deriving (Eq)


foldAB::(AB a->b)->(b->a->b->b)->AB a->b
foldAB fnil frec t = case t of
 Nil -> fnil t
 Bin i r d -> frec (foldAB fnil frec i) r (foldAB fnil frec d)


mismaEstructura::Eq a => AB a -> AB a -> Bool
mismaEstructura = foldAB f g

f:: Eq a => AB a -> AB a -> Bool
f t = (\x -> if x == Nil then True else False)

g:: Eq a =>(AB a -> Bool) -> a -> (AB a -> Bool) -> (AB a -> Bool)
g f1 a f2 (Bin i r d) = (f1 i) && (f2 d)
g f1 a f2 Nil = False