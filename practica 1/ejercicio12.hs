--Ejercicio 12 F El siguiente esquema captura la recursi´on primitiva sobre listas.
recr::(a->[a]->b->b)->b->[a]->b 
recr _ z [] = z 
recr f z (x:xs) = f x xs (recr f z xs)
--a. Deﬁnir la funci´on sacarUna :: Eq a => a -> [a] -> [a], que dados un elemento y una lista devuelve el resultado de eliminar de la lista la primera aparici´on del elemento (si est´a presente).
--b. Explicar por qu´e el esquema foldr no es adecuado para implementar la funci´on sacarUna del punto anterior.
--c. La funci´on listasQueSuman del ejercicio 7, ¿se ajusta al esquema de recursi´on recr? ¿Por qu´e o por qu´e no?

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna a = recr (\x xs rec-> if a == x then xs else x:rec) [] 


{-|
porque en la funcion, al no recibir la cola de la lista como argumento no tiene la opcion de devolver lo que queda de la lista tal cual como esta, 
entonces no hay forma de sacar una sola aparicion del elemento, es decir solo serviria para sacar todas las apariciones del elemento
-}

{-|
sacarUna 2 [1,2,2,3]
recr (\x xs rec-> if 2 == x then xs else x:rec) []  2 [1,2,2,3]
(\x xs rec-> if 2 == x then xs else x:rec) 1 [2,2,3] (recr (\x xs rec-> if 2 == x then xs else x:rec) [] [2,2,3])
1:((recr (\x xs rec-> if 2 == x then xs else x:rec) [] [2,2,3]))
1:((\x xs rec-> if 2 == x then xs else x:rec) 2 [2,3] (recr (\x xs rec-> if 2 == x then xs else x:rec) [] [2,3]))
1:[2,3] 
-}

--listasQueSuman:: Int -> [[Int]]
--listasQueSuman 0 = [[]]
--listasQueSuman n = recr (\x xs rec-> ) [[]] 

--listasQueSuman n = [x:l| x <- [1..n], l <- listasQueSuman (n-x)]
--listasQueSuman n = recr (\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) [[]] [1..n]


{-|
listasQueSuman 3 
recr (\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) [[]] [1,2,3]
(\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) 1 [2,3] (recr (\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) [[]] [2,3])
[1:l| l <- listasQueSuman (2)] ++ [2:l| l <- listasQueSuman (1)] ++ [3:l| l <- listasQueSuman (0)]

[1:l| l <- listasQueSuman (2)] ++ [2:l| l <- listasQueSuman (1)] ++ [[3]]



-----------
listasQueSuman 1
recr (\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) [[]] [1]
(\x xs rec-> [x:l| l <- listasQueSuman (n-x)] ++ rec) 1 [] ([[]])
[1:l| l <- listasQueSuman (0)] ++ ([[]])
[[1]] ++ 

-}


