type MatrizInfinita a = Int->Int->a

--identidad = \i j->if i==j then 1 else 0 
--cantor = \x y->(x+y)*(x+y+1)‘div‘2+y 
--pares = \x y->(x,y)

fila::Int->MatrizInfinita a->[a]
fila x m = [ m x y | y <- [0..] ]

columna::Int->MatrizInfinita a->[a]
columna y m= [ m x y | x <- [0..]]

trasponer::MatrizInfinita a->MatrizInfinita a
trasponer m = (\i j -> m j i)

mapMatriz::(a->b)->MatrizInfinita a->MatrizInfinita b
mapMatriz f m = (\i j -> f (m i j))

filterMatriz::(a->Bool)->MatrizInfinita a->[a]
filterMatriz f m = [m j (i-j) | i<-[0..], j<-[0..i], f (m j (i-j))]

zipWithMatriz::(a->b->c)->MatrizInfinita a->MatrizInfinita b->MatrizInfinita c
zipWithMatriz f m1 m2 = \i j-> f (m1 i j) (m2 i j)

suma::Num a=>MatrizInfinita a->MatrizInfinita a->MatrizInfinita a
suma m1 m2 = zipWithMatriz (+) m1 m2

zipMatriz::MatrizInfinita a->MatrizInfinita b->MatrizInfinita (a,b)
zipMatriz m1 m2 = \i j-> (m1 i j, m2 i j)


{-|
x y  	y (x-y)
0 0  	0	0
1 0  	0	1
1 1		1	0
2 0		0	2
2 1		1	1
2 2		2	0
3 0		0	3
3 1		1	2
3 2		2	1
3 3		3	0
-}