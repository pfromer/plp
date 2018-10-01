--ejercocicio 16
generate :: ([a] -> Bool) -> ([a] -> a) -> [a] 
generate stop next = generateFrom stop next []

generateFrom:: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a] 
generateFrom stop next xs | stop xs = init xs 
 | otherwise = generateFrom stop next (xs ++ [next xs])


{-|

i. Usando generate, deﬁnir generateBase::([a] ->Bool) ->a ->(a ->a) ->[a], similar a generate, 
pero con un caso base para el elemento inicial, y una funci´on que, en lugar de calcular el siguiente elemento en base a la lista completa, 
lo calcula solo a partir del u´ltimo elemento. 
Por ejemplo: generateBase (\l->not (null l) && (last l > 256)) 1 (*2) es la lista las potencias de 2 menores o iguales que 256.
-}
 
generateBase::([a]->Bool)->a->(a->a)->[a]
--generateBase stop casoBase next = generateFrom stop (\l -> next (last l)) [casoBase]
generateBase stop casoBase next = generate stop (\l -> if null l then casoBase else next (last l)) 

--ii. Usando generate, deﬁnir factoriales::Int ->[Int], que dado un entero n genera la lista de los primeros n factoriales.

factoriales::Int ->[Int]
factoriales n = 1:(generate (\l-> length l + 1 > n ) (\l -> if null l then 1 else (length l + 1) * last l))

--iii. Usando generateBase, deﬁnir iterateN :: Int -> (a -> a) -> a -> [a] que, 
--toma un entero n, una funci´on f y un elemento inicial x, 
--y devuelve la lista [x, f x, f (f x), ..., f ( ...(f x) ...)] de longitud n. Nota: iterateN n f x = take n (iterate f x).

iterateN :: Int -> (a -> a) -> a -> [a]
iterateN n f a = generateBase (\l-> length l == n + 1) a (f)

--iv. Redeﬁnir generateFrom usando iterate y takeWhile.
--generateFrom':: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a] 
--generateFrom' stop next xs = if stop xs then init xs else xs:(takeWhile ((\x-> not stop )        )) 

--takeWhile (\x-> not (stop x)) (iterate (next) (last xs))

--generateFrom (\l -> length l > 8) sum [2]
--[2,2,4,8,16,32,64,128]



