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
