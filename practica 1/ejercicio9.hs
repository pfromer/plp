import Data.List
type DivideConquer a b = (a -> Bool) -> (a -> b) -> (a -> [a]) -> ([b] -> b) -> a -> b

dc :: DivideConquer a b
dc trivial solve split combine x = if trivial x then solve x else combine (map (dc trivial solve split combine) (split x))

mergeSort :: Ord a =>[a] ->[a]
mergeSort = dc (\x -> length x == 1) id partirEnDos juntar

partirEnDos :: [a]->[[a]]
partirEnDos l = [take (length l `div` 2) l, drop (length l `div` 2) l]

juntar :: Ord a => [[a]]->[a]
juntar l = foldr (\x rec -> insertarOrdenado x rec) [] (concat l)

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado a l = (filter  (\x -> x < a) l) ++ [a] ++ (filter (\x -> x >= a) l)

myMap :: (a->b) ->[a] ->[b]
myMap f [] = []
myMap f l =  dc (\x -> length x == 1) (\x -> [f (head x)]) partirEnDos concat l

myFilter :: (a ->Bool)->[a]->[a]
myFilter p [] = []
myFilter p l = dc (\x -> length x == 1) (\x -> if p (head x) then x else []) partirEnDos concat l


mostCommon :: Ord a => [a] -> a
mostCommon = snd . maximum . map (\xs -> (length xs, head xs)) . group . sort 

cantidadAparicionesDelMasComun :: Ord a => [a] -> Int
cantidadAparicionesDelMasComun = fst . maximum . map (\xs -> (length xs, head xs)) . group . sort


{-| La forma en que funciona es, dado un input x, verifica si es o no un caso base utilizando la funci´on trivial.
En caso de serlo, utilizaremos solve para dar el resultado final. En caso de no ser un caso base, partimos
el problema utilizando la funci´on split y luego combinamos los resultados recursivos utilizando combine.
Por ser este un esquema de recursi´on, puede utilizarse recursi´on expl´ıcita para definirlo.


ii. Implementar la funci´on mergeSort :: Ord a =>[a] ->[a] en t´erminos de dc.
mergeSort = dc ... (se recomienda utilizar break y aplicaci´on parcial para definir la funci´on de combine).


type DivideConquer a b = (a -> Bool) -- determina si es o no el caso trivial
-> (a -> b) -- resuelve el caso trivial
-> (a -> [a]) -- parte el problema en sub-problemas
-> ([b] -> b) -- combina resultados
-> a -- estructura de entrada
-> b -- resultado

juntarLasDos [3,6,9] [1,7,10] = 
juntarasDosAux [3,6,9] [1,7,10] []
juntarasDosAux [3,6,9] [7,10] [1]
juntarasDosAux [6,9] [7,10] [1,3]
juntarasDosAux [9] [7,10] [1,3,6]
juntarasDosAux [9] [10] [1,3,6,7]
juntarasDosAux [] [10] [1,3,6,7,9]


foldr ::(a -> b -> b) -> b -> [a] -> b 


juntar l = juntarLasDos (l!!0) (l!!1)

juntarLasDos :: Ord a => [a]->[a]->[a]
juntarLasDos l1 l2 = juntarasDosAux l1 l2 []


juntarasDosAux ::  Ord a => [a]->[a]->[a]->[a]
juntarasDosAux [] l2 res = res ++ l2
juntarasDosAux l1 [] res = res ++ l1
juntarasDosAux (x:xs) (y:ys) (res) = if x<y then juntarasDosAux xs (y:ys) (res ++ [x]) else juntarasDosAux (x:xs) (ys) (res ++ [y])

-}