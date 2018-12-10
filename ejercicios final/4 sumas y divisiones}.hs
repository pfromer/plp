data Expr = Cte Float | Sum Expr Expr | Div Expr Expr

foldEstr::(Float->b)->(b->b->b)->(b->b->b)->Expr->b
foldEstr casoCte fSuma fDiv e = 
 case e of
 Cte f -> casoCte f
 Sum e1 e2 -> fSuma (rec e1) (rec e2)
 Div e1 e2 -> fDiv (rec e1) (rec e2)
 where rec = foldEstr casoCte fSuma fDiv

 
eval::Expr->Maybe (Float,[Char])
eval = foldEstr (\x-> Just (x, "")) 
 (\rec1 rec2 -> makeTuple " + "  (+) rec1 rec2)
 (\rec1 rec2 -> if anyTupleIsNothing rec1 rec2 || ((fst (toTuple rec2)) == 0) then Nothing else makeTuple " / "  (/) rec1 rec2)

 
 
makeTuple::[Char]->(Float->Float->Float)->Maybe(Float,[Char])->Maybe (Float,[Char])->Maybe (Float,[Char])
makeTuple symbol f t1 t2 = if anyTupleIsNothing t1 t2 then Nothing else
 Just (f (fst (toTuple t1)) (fst (toTuple t2)), (show (fst (toTuple t1))) ++ symbol ++ 
 (show (fst (toTuple t2))) ++ " = " ++ (show (f (fst (toTuple t1)) (fst (toTuple t2)))) ++ ". " ++ (snd (toTuple t1)) ++  (snd (toTuple t2)))

toTuple::Maybe (a,b)->(a,b)
toTuple (Just (f,c)) = (f,c)

anyTupleIsNothing::Maybe (a,b)->Maybe (a,b)->Bool
anyTupleIsNothing t1 t2 = isNothing t1 || (isNothing t2)

isNothing::Maybe (a,b)->Bool
isNothing Nothing = True
isNothing (Just(a,b)) = False 

