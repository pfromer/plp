--i. Deﬁnir la funci´on partes, que recibe una lista L y devuelve la lista de todas las listas formadas por los mismos elementos de L, 
--en su mismo orden de aparici´on. Ejemplo: partes [5, 1, 2] → [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]] (en algu´n orden).
--ii. Deﬁnir la funci´on prefijos, que dada una lista, devuelve todos sus preﬁjos. Ejemplo: prefijos [5, 1, 2] → [[], [5], [5, 1], [5, 1, 2]] 
--iii. Deﬁnir la funci´on sublistas que, dada una lista, devuelve todas sus sublistas (listas de elementos que aparecen consecutivos en la lista original). 
--Ejemplo: sublistas [5, 1, 2] → [[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]] (en algu´n orden).


partes :: [a] -> [[a]]
partes = foldr (\x rec-> rec ++ (agregarAlPrincipioDeCadaLista rec x)) [[]]

agregarAlPrincipioDeCadaLista :: [[a]] -> a -> [[a]]
agregarAlPrincipioDeCadaLista l e = map (\x -> e:x) l

prefijos::[a]->[[a]]
prefijos l = [take i l | i<-[0..length l]]

sublistas::[a]->[[a]]
sublistas l = concat [todasLasSubListasConXElementos l x | x<-[0..length l]]


todasLasSubListasConXElementos :: [a] -> Int -> [[a]]
todasLasSubListasConXElementos l 0 = [[]]
todasLasSubListasConXElementos l x = [take x (drop i l) | i <- [0..length l - x]]
--quiero que queden listas de x elementos. tengo que sacar (length l - x) elementos
--lo que sumo entre drop y take tiene que dar (l - x)
--[drop a (take b l) | a <-[0..length l], b <-[0..length l], a + b == (length l - x)]


{-|




[1,2,3,4]



n	x
	
0	0

1	0
1	1

2	0
2	1
2	2

3	0
3	1
3	2
3	3

x	n-x
0	0	[1,2,3]

0	1	[1,2]
1 	0	[]

0	2
1	1
2	0

0   3 
1	2
2	1
3	0


[1,2,3]	3 0
[1,2]	3 1
[1]		3 2	
[]		3 3	

todas las formas de sacar 0
[1,2,3]

todas las formas de sacar 1
[1,2]
[2,3]

todas las formas de sacar 2
[3]
[1]

todas las formas de sacar 3
[]
-}





