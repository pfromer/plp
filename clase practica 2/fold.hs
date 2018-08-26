negar :: [[Char]] -> [[Char]]
negar = map (\x -> "in" ++ x)

sinVacias :: [[a]] -> [[a]]
sinVacias = filter (\x-> length x /= 0)

--all sin recursion
myAll :: (a -> Bool) -> [a] -> Bool
--myAll p ls = length (filter p ls) == length ls

--all con recursion
--myAll p [] = True
--myAll p (x:xs) = p x && myAll p xs

--all con foldr
myAll p = myFoldr (\x rec -> p x && rec) True



--concat con recursion
--myConcat :: [[a]] -> [a]
--myConcat [] = []
--myConcat (x:xs) = x ++ myConcat xs





--en los dos tengo un caso base
--True | []
--en los dos itero sobre lista
--en los dos aplico una funcion a un elemeneto de la lista y aplico un operador binario junto con la parte recursiva

----------
myFoldr ::(a -> b -> b) -> b -> [a] -> b 
myFoldr f z [] = z 
myFoldr f z (x:xs) = f x (myFoldr f z xs)

--foldr (+) 0 [1..]
--1 + (foldr (+) 0 [2..])
--1 + (2 + (foldr (+) 0 [3..])
--1 + (2 + 3 + (foldr (+) 0 [4..])

---------
myConcat :: [[a]] -> [a]
myConcat = myFoldr (\x rec -> x ++ rec) []
------

longitud :: [a] -> Int
longitud = myFoldr (\x rec -> 1 + rec) 0
---
--producto :: [Int] -> Int
--producto = myFoldr (\x rec -> x * rec) 1

--
myMap :: (a -> b) -> [a] -> [b]
myMap f = myFoldr (\x rec -> f x : rec) []
--

myFilter :: (a -> Bool) ->[a] -> [a]
myFilter p = myFoldr (\x rec -> if p x then x:rec else rec) []

---
myFoldl :: (b -> a -> b) -> b -> [a] -> b 
myFoldl f z [] = z 
myFoldl f z (x : xs) = myFoldl f (f z x) xs

--foldl (+) 0 [1..] 
--foldl (+) (0 + 1) [2..] 
--foldl (+) (0 + 1 + 2) [3..]
--foldl (+) (0 + 1 + 2 + 3) [4..]

producto :: [Int] -> Int
producto = myFoldl (*) 1

reverso :: [a] -> [a]
reverso = myFoldl (\acum x -> (x:acum)) []

--reverso "hola"
--myFoldl (\acum x -> (x:acum)) [] "hola"
--myFoldl (\acum x -> (x:acum)) ([h]) "ola"
--myFoldl (\acum x -> (x:acum)) ([o,h]) "la"
--myFoldl (\acum x -> (x:acum)) ([l,o,h]) "a"
--myFoldl (\acum x -> (x:acum)) ([a,l,o,h]) ""
--[a,l,o,h]

ultimo :: [a] -> a
ultimo = foldl1(\acum x -> x)


--ultimo de una lista con foldl1
--foldl1 (\acum x -> x) [1,2,3] =
--fold (\acum x -> x) (1) [1,2,3] 
--fold (\acum x -> x) (1) [2,3]
--fold (\acum x -> x) (2) [3]
--fold (\acum x -> x) (3) []
--3

--ultimo de una lista con foldr1
--foldr1 (\x rec -> rec) [1,2,3]
--foldr (\x rec -> rec) (3) [1,2,3]
--(\x rec -> x) 1 (foldr (\x rec -> x) 3 [2,3])
--foldr (\x rec -> x) 3 [2,3]
--foldr (\x rec -> x) 3 [3]
--foldr (\x rec -> x) 3 []
--3


myMaximum :: Ord a => [a] -> a
myMaximum ls = foldr1 (max) ls
--myMaximum ls = foldl1 (max) ls

f1 :: [Bool] -> Bool 
f1 = foldr (&&) True

--Que computan estas funciones (clase 2 pag 12)
--f1 [True, False, True]
--foldr (&&) True [True, False, True]
-- True && (foldr True [False, True])
--True && (False && (foldr True [True]))
--True && (False && (True && (foldr True [])) 
--True && (False && (True && (True))

--f2 :: [a] -> [a] 
--f2 = foldr (:) []

--f2 [1,2,3]
--foldr (:) [] [1,2,3]
--1 : (foldr (:) [] [2,3])
--1 : (2 : (foldr (:) [] [3]))
--1 : (2 : (3 : (foldr (:) [] [])))
--1 : (2 : (3 : ([])))
--1 : (2 : ([3]))
--1 : ([2,3])
--[1,2,3]


--f3 :: [a] -> [a] -> [a] 
--f3 xs ys = foldr (:) ys xs
--f3 [1,2] [3,4]
--foldr (:) [1,2] [3,4]
--3 : (foldr (:) [1,2] [4])
--3 : (4 : (foldr (:) [1,2] []))
--3 : (4 : ([1,2]))
--[3,4,1,2]

--f4 :: [a] -> [a] 
--f4 = foldl (flip (:)) []
--f4 [1,2,3]
--foldl (flip (:)) [] [1,2,3]
--foldl (flip (:)) (flip (:) [] 1)  [2,3]
--foldl (flip (:)) [1]  [2,3]
--foldl (flip (:)) (flip (:) [1] 2)  [3]
--foldl (flip (:)) [2,1]  [3]
--foldl (flip (:)) (flip (:) [2,1] 3) []
--foldl (flip (:)) ([3,2,1]) []
--[3,2,1]

recr ::(a -> [a] -> b -> b) -> b -> [a] -> b 
recr _ z [] = z 
recr f z (x:xs) = f x xs (recr f z xs)


insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs rec -> if e > x then x:rec else e:x:xs) [e]


--insertarOrdenado 3 [1,4,5]
--recr (\x xs rec -> if 3 > x then x:rec else 3:x:xs) [3] [1,4,5]
--(\x xs rec -> if 3 > x then x:rec else 3:x:xs) 1 [4,5] (recr (\x xs rec -> if 3 > x then x:rec else 3:x:xs) [3] [4,5])
--1:(recr (\x xs rec -> if 3 > x then x:rec else 3:x:xs) [3] [4,5])
--1:3:[4,5]

pertenece :: Eq a => a -> [a] -> Bool 
pertenece e = foldr (\x rec -> x == e || rec) False

--foldl :: (b -> a -> b) -> b -> [a] -> b 
--foldl f z [] = z 
--foldl f z (x : xs) = foldl f (f z x) xs

--foldr ::(a -> b -> b) -> b -> [a] -> b 
--foldr f z [] = z 
--foldr f z (x:xs) = f x (foldr f z xs)

myTake = flip take'
take':: [a]->Int->[a]
--take' [] = const []
--take' (x:xs) = \n-> if n == 0 then [] else x:take' xs n-1
take' = foldr(\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const [])


--take' [a,b,c,d] 3
--(foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [a,b,c,d]) 3
--((\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) a (foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [b,c,d])) 3
--(\n -> if n == 0 then [] else a:((foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [b,c,d]) 2)) 3 
--a:((foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [b,c,d]) 2)
--a:((\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) b (foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [c,d])) 2
--a:(\n -> if n == 0 then [] else b:(foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [c,d])) 1) 2
--a:b:((foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [c,d]) 1)
--a:b:((\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) c (foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [d]) 1)
--a:b:(\1 -> if 1 == 0 then [] else c:(foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [d]) 0)
--a:b:(c:(foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const []) [d]) 0)
--a:b:(c:((\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) d (foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const [])[]))0)
--a:b:(c:((\n -> if n == 0 then [] else d:(foldr (\x rec-> \n -> if n == 0 then [] else x:rec(n-1)) (const [])[])(n-1)))0)
--a:b:c:[]



--_take :: Int -> [a] -> [a] 
--_take = foldr(\x rec-> \n-> if n == 0 then [] else x:rec(n-1)) (const [])


--_take 2 [1,2,3,4]
--foldr (\x rec-> \n-> if n == 0 then [] else x:rec(2-1)) const [] [1,2,3,4]
data AEB a = Hoja a | Bin (AEB a) a (AEB a)

foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b 
foldAEB fHoja fBin t = case t of 
 Hoja n -> (fHoja n) 
 Bin t1 n t2 -> (fBin (rec t1) n (rec t2)) 
 where rec = foldAEB fHoja fBin
 
altura :: AEB a -> Int
altura = foldAEB (\x -> 0) (\x y z -> 1 + (max x z))

espejo :: AEB a -> AEB a
espejo = foldAEB Hoja (\x y z -> Bin z y x)

ramas :: AEB a -> [[a]]
ramas = foldAEB (\x -> [[x]]) (\x y z -> agregarAlPrincipio y x ++ agregarAlPrincipio y z) 
--ramas (Bin (Hoja 3) 5 (Bin ((Bin (Hoja 107) 18 (Hoja 11))) 8 (Hoja 1)))

--	      5
--  3          8 
--         18     1
--      107  11

agregarAlPrincipio :: a -> [[a]] -> [[a]]
agregarAlPrincipio e = map (\x -> [e] ++ x)

nodos :: AEB a -> Int
nodos = foldAEB (\x -> 1) (\x y z -> 1 + z + x)

hojas :: AEB a -> Int
hojas = foldAEB (\x -> 1) (\x y z -> z + x)


