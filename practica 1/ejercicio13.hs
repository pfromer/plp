genLista :: a -> (a -> a) -> Int -> [a]
genLista e f n = take n (iterate f e)

--Usando genLista, deﬁnir la funci´on desdeHasta, que dado un par de nu´meros (el primero menor que el segundo), 
--devuelve una lista de nu´meros consecutivos desde el primero hasta el segundo.

desdeHasta :: Int -> Int -> [Int]
desdeHasta a b = genLista a succ (1 + b - a)
