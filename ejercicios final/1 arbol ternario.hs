data AT a = Nil 
 | Tern a (AT a) (AT a) (AT a)  deriving Eq

foldArbolTernario::Eq a=>b->(a->b->b->b->b)->AT a->b
foldArbolTernario casoNil fTernario arbol =
 case arbol of
 Nil -> casoNil
 Tern a0 a1 a2 a3 -> fTernario a0 (rec a1) (rec a2) (rec a3)
 where rec = foldArbolTernario casoNil fTernario


foldPrimitivoArbolTernario::Eq a=>b->(AT a->b->b->b->b)->AT a->b
foldPrimitivoArbolTernario casoNil fTernario arbol =
 case arbol of
 Nil -> casoNil
 Tern a0 a1 a2 a3 -> fTernario (Tern a0 a1 a2 a3) (rec a1) (rec a2) (rec a3)
 where rec = foldPrimitivoArbolTernario casoNil fTernario



esSubarbol::Eq a=>AT a -> AT a -> Bool
esSubarbol Nil = (\x -> True)
esSubarbol a1 = 
 foldPrimitivoArbolTernario (False) (\a rec1 rec2 rec3 -> iguales a a1 || rec1 || rec2 || rec3)

iguales::Eq a=>AT a -> AT a -> Bool
iguales = foldArbolTernario casoNil g

casoNil:: Eq a => AT a -> Bool
casoNil = (\x -> if x == Nil then True else False)

g:: Eq a =>a -> (AT a -> Bool) -> (AT a -> Bool) -> (AT a -> Bool) -> (AT a -> Bool)
g a f1 f2 f3 (Tern r a1 a2 a3) = (a == r) && (f1 a1) && (f2 a2) && (f3 a3)
g a f1 f2 f3 Nil = False

arbol0 = Tern 0 Nil Nil Nil
arbol1 = Tern 1 Nil Nil Nil
arbol2 = Tern 2 arbol1 Nil Nil 
arbol3 = Tern 3 arbol1 arbol2 Nil
arbol4 = Tern 5 arbol2 arbol2 arbol2







 
data Polinomio a = X 
 | Cte a 
 | Suma (Polinomio a) (Polinomio a) 
 | Prod (Polinomio a) (Polinomio a)
 
foldPolinomio :: b->(a->b)->(b->b->b)->(b->b->b)->Polinomio a->b
foldPolinomio casoX fCte fSuma fProd p = case p of
 X -> casoX
 Cte n -> fCte n
 Suma p1 p2 -> fSuma (rec p1) (rec p2)
 Prod p1 p2 -> fProd (rec p1) (rec p2)
 where rec = foldPolinomio casoX fCte fSuma fProd
 
evaluar :: Num a => a -> Polinomio a -> a
evaluar n = foldPolinomio n id (+) (*) 

--evaluar 7 (Suma (Prod (Suma X (Cte 9)) (Prod X X)) (Cte 9))
