myMax::(Int,Int)->Int
myMax(a,b) = if a > b then a else b

myUncurry::(a->b->c)->((a,b)->c)
myUncurry f tuple = f (fst tuple) (snd tuple) 

myCurry::((a,b)->c) -> a -> b -> c
myCurry f a b = f(a,b)

componer::(b->c)->(a->b)->(a->c)
componer f g x = f (g x) 

suma::Int->Int->Int
suma a b = a + b

multiplicacion::Int->Int->Int
multiplicacion a b = a * b


--myCurry myMax 6 4
--myMax(6,4)
--6

--myUncurry max (6,4)
--max 6 4
--6

--myCurry myUncurry max 6 4
--myCurry (max(6,4))

--ESTO FUNCIONA
--componer myUncurry myCurry myMax (4,6)
--myUncurry (myCurry myMax) (4,6)
--(myCurry myMax) 4 6
--myMax(4,6)


--ESTO NO FUNCIONA
--myUncurry myCurry myMax (4,6)
--primero trata de resolver myUncurry, pero la ecuacion no la puede resolver porque myMax no es una tupla



