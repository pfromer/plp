--mapPares, una versi´on de map que toma una funci´on curriﬁcada de dos argumentos y una lista de pares de valores, 
--y devuelve la lista de aplicaciones de la funci´on a cada par. Pista: recordar curry y uncurry.

mapPares :: (a->b->c)->[(a,b)]->[c]
mapPares f = map (uncurry f) 

armarPares :: [a] -> [b] -> [(a,b)]
armarPares xs = foldr f (const []) xs

f::a->([b]->[(a,b)])->([b]->[(a,b)])
f x g [] = []
f x g (y:ys) = (x,y):(g ys)



--iii. mapDoble, una variante de mapPares, que toma una funci´on curriﬁcada de dos argumentos y dos listas (de igual longitud), 
--y devuelve una lista de aplicaciones de la funci´on a cada elemento correspondiente de las dos listas. 
--Esta funci´on en Haskell se llama zipWith.

mapDoble :: (a->b->c)->[a]->[b]->[c]
mapDoble f l1 l2 = map (uncurry f) (armarPares l1 l2)






--esta otra definicion de armar pares no sirve cuadno la primer lista es mas larga que la segunda pero anda igual
--armarPares xs = foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) xs
{-|
armarPares xs = foldr (\x rec -> G) (const []) xs

armarPares [1,2,3] = foldr (\x rec -> g) (const []) [1,2,3]


(\x rec -> g) 1 (foldr (\x rec -> g) (const []) [2,3])
(\x rec -> g) 1 ((\x rec -> g) 2 (foldr (\x rec -> g) (const []) [3])
(\x rec -> g) 1 ((\x rec -> g) 2 ((\x rec -> g) 3 (foldr (\x rec -> g) (const []) [])))

(\x rec -> g) 1 ((\x rec -> g) 2 ((\x rec -> g) 3 (foldr (\x rec -> (\(y:ys) -> (x,y):(rec ys))) (const []) [])))


(\x rec -> g) 1 ((\x rec -> g) 2 ((\x rec -> g) 3 (const [])))

(\x rec -> g) 1 ((\x rec -> g) 2 ((\x rec -> (\(y:ys) -> (x,y):(rec ys))) 3 (const [])))


(\x rec -> g) 1 ((\x rec -> g) 2 (\(y:ys) -> (3,y):(const [] ys)))


(\x rec -> g) 1 ((\x rec -> (\(y:ys) -> (x,y):(rec ys))) 2 (\(y:ys) -> (3,y):(const [] ys)))


(\x rec -> g) 1 (\(y:ys) -> (2,y):((\(y:ys) -> (3,y):(const [] ys))) ys)

(\x rec -> (\(y:ys) -> (x,y):(rec ys))) 1 (\(y:ys) -> (2,y):((\(y:ys) -> (3,y):(const [] ys))) ys)


(\(y:ys) -> (1,y):((\(y:ys) -> (2,y):((\(y:ys) -> (3,y):(const [] ys))) ys) ys))

--foldr ::(a -> b -> b) -> b -> [a] -> b 
--foldr f z [] = z 
--foldr f z (x:xs) = f x (foldr f z xs)




(\(y:ys) -> (x,y):(rec ys))

-}














{-|

armarPares [1,2,3] [4,5,6]
foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [1,2,3] [4,5,6]
(\x rec -> \(y:ys) -> (x,y):(rec ys)) 1 (foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [2,3] ) [4,5,6]




(\(y:ys) -> (1,y):((foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [2,3] ) ys)) [4,5,6]
(\(y:ys) -> (1,y):(((\(y:ys) -> (2,y):((foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [2,3] ) ys))) ys))[4,5,6]
(\(y:ys) -> (1,y):(((\(y:ys) -> (2,y):((foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [3]) ys))) ys))[4,5,6]












foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [2,3] 

(\x rec -> \(y:ys) -> (x,y):(rec ys)) 2 (foldr (\x rec -> \(y:ys) -> (x,y):(rec ys)) (const []) [3])
-}

--foldr ::(a -> b -> b) -> b -> [a] -> b 
--foldr f z [] = z 
--foldr f z (x:xs) = f x (foldr f z xs)


--armarPares _ [] = []
--armarPares [] _ = []
--armarPares (x:xs) (y:ys) = (x,y):armarPares xs ys



