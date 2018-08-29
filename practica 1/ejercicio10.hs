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

sumaAlt :: sumaAlt