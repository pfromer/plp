{-|
Ejercicio 10 
i. Redefinir usando foldr las funciones sum, elem, (++), filter y map.
ii. Definir la funci´on mejorSeg´un :: (a -> a -> Bool) -> [a] -> a, que devuelve el m´aximo elemento
de la lista seg´un una funci´on de comparaci´on, utilizando foldr1. Por ejemplo, maximum = mejorSeg´un
(>).
iii. Definir la funci´on sumaAlt, que realiza la suma alternada de los elementos de una lista. Es decir, da como
resultado: el primer elemento, menos el segundo, m´as el tercero, menos el cuarto, etc. Usar foldr.
iv. Hacer lo mismo que en el punto anterior, pero en sentido inverso (el ´ultimo elemento menos el ante´ultimo,
etc.). Pensar qu´e esquema de recursi´on conviene usar en este caso.
v. Definir la funci´on permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus permutaciones.
Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y tambi´en take y drop.}
-}

mySum :: [Int] -> Int
mySum = foldr (+) 0

myElem :: Eq a => a -> [a] -> Bool
myElem e  = foldr (\x rec -> x==e || rec) False


--NO ME SALE
juntarDosListas :: [a] -> [a] -> [a]
juntarDosListas l1 l2 = foldr (\x rec -> x:rec) (foldr (\x rec -> x:rec) [] l2) l1 

myFilter :: (a->Bool) -> [a] ->  [a]
myFilter p = foldr (\x rec -> if (p x) then x:rec else rec) []

myMap :: (a->b) -> [a] ->  [b]
myMap f = foldr (\x rec -> (f x):rec) []

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if f x rec then x else rec) 


sumaAlt :: [Int] -> Int
--sumaAlt l = (foldr (+) 0 [l!!i|i <- [0..length l - 1], even i]) - (foldr (+) 0 [l!!i| i <- [1..length l - 1], odd i])
sumaAlt l = foldr (\x rec -> if fst x then rec + (snd x) else rec - (snd x)) 0 ([(even i , l!!i) | i <- [0..length l - 1]])


permutaciones :: [a] -> [[a]]
permutaciones = foldl (\rec x -> insertarEnTodasLasPosiciones x rec) [[]]
--permutaciones = foldr (\x rec -> insertarEnTodasLasPosiciones x rec) [[]]
--permutaciones []   = [[]]
--permutaciones (x:xs) = insertarEnTodasLasPosiciones x (permutaciones xs) 

insertarEnTodasLasPosiciones :: a -> [[a]] -> [[a]]
insertarEnTodasLasPosiciones e  = concatMap (\l -> [(take i l) ++ [e] ++ (drop i l)| i <- [0..length l]])

--con foldl
--permutaciones [1,2,3] = 
--foldl (\rec x -> insertarEnTodasLasPosiciones x rec) [[]] [1,2,3]
--foldl (\rec x -> insertarEnTodasLasPosiciones x rec) ([[1]]) [2,3]
--foldl (\rec x -> insertarEnTodasLasPosiciones x rec) ([[1,2],[2,1]]) [3]
--foldl (\rec x -> insertarEnTodasLasPosiciones x rec) ([[3,1,2],[1,3,2],[1,2,3],[3,2,1],[2,3,1],[2,1,3]]) []
--[[3,1,2],[1,3,2],[1,2,3],[3,2,1],[2,3,1],[2,1,3]]

--con foldr
--permutaciones [1,2,3] = 
--foldr (\x rec -> insertarEnTodasLasPosiciones x rec) [[]] [1,2,3]
--(\x rec -> insertarEnTodasLasPosiciones x rec) 1 (foldr (\x rec -> insertarEnTodasLasPosiciones x rec) [[]] [2,3])
--(\x rec -> insertarEnTodasLasPosiciones x rec) 1 ((\x rec -> insertarEnTodasLasPosiciones x rec) 2 (foldr (\x rec -> insertarEnTodasLasPosiciones x rec) [[]] [3]))
--(\x rec -> insertarEnTodasLasPosiciones x rec) 1 ((\x rec -> insertarEnTodasLasPosiciones x rec) 2 ((\x rec -> insertarEnTodasLasPosiciones x rec) 3 (foldr (\x rec -> insertarEnTodasLasPosiciones x rec) [[]] [])))

--reemplazo ((\x rec -> insertarEnTodasLasPosiciones x rec) por f 

--foldr f [[]] [1,2,3]
--f 1 (foldr f [[]] [2,3])
--f 1 (f 2 (foldr f [[]] [3]))
--f 1 (f 2 (f 3 (foldr f [[]] [])))
--f 1 (f 2 (f 3 [[]]))
--f 1 (f 2 [[3]])
--f 1 [[2,3],[3,2]]
--[[3,1,2],[1,3,2],[1,2,3],[3,2,1],[2,3,1],[2,1,3]]

--foldl :: (b -> a -> b) -> b -> [a] -> b 
--foldl f z [] = z 
--foldl f z (x : xs) = foldl f (f z x) xs

--foldr ::(a -> b -> b) -> b -> [a] -> b 
--foldr f z [] = z 
--foldr f z (x:xs) = f x (foldr f z xs)









{-|


permutaciones [1,2,3]

[[2,3],[3,2]] -> [[1,2,3], [2,1,3], [2,3,1], [1,3,2], [3,1,2], [3,2,1]]







[1,2,3,4] -> 


1
	12
		123
			1234
		124
			1243
	13
		132
			1324
		134
			1342
	14
		142
			1423
		143
			1432
2
	21
		213
			2134
		214
			2143
	23
		231
			2314
		234
			2341
		
	24
		241
			2413
		243
			2431
3
	31
		312
			3124
		314
			3142
	32
		321
			3214
		324
			3241
	34
		341
			3412
		342
			3421

4
	41
		412
		413
	42
		421
		423
	43
		431
		432

-}















