--Ejercicio 15 i. Escribir la funci´on sumaMat, que representa la suma de matrices, usando zipWith. 
--Representaremos una matriz como la lista de sus ﬁlas. Esto quiere decir que cada matriz ser´a una lista ﬁnita de listas ﬁnitas, 
--todas de la misma longitud, con elementos enteros. Recordamos que la suma de matrices se deﬁne como la suma celda a celda.
-- Asumir que las dos matrices a sumar est´an bien formadas y tienen las mismas dimensiones. sumaMat :: [[Int]] -> [[Int]] -> [[Int]]

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = zipWith sumarDosListasDeEnteros 


sumarDosListasDeEnteros :: [Int] -> [Int] -> [Int]
sumarDosListasDeEnteros = zipWith (+)


--recr::(a->[a]->b->b)->b->[a]->b 
--recr _ z [] = z 
--recr f z (x:xs) = f x xs (recr f z xs)


--Escribir la funci´on trasponer, que, dada una matriz como las del´ıtem i, devuelva su traspuesta. 
--Es decir, en la posici´on i,j del resultado est´a el contenido de la posici´on j,i de la matriz original. 
--Notar que si la entrada es una lista de N listas, todas de longitud M, entonces el resultado debe tener M listas, todas de longitud N. 

trasponer :: [[Int]] -> [[Int]]
trasponer m = foldr f [] m

f::[Int]->[[Int]]->[[Int]]
f x m = if length m == 0 then (foldr(\e rec -> [e]:rec ) [] x) else (foldr (\mi rec-> \(xi:xs)-> (xi:mi):rec xs) (const []) m) x


--f x [] = [[x!!i]| i <-[0..length x - 1]]
--f x m = [x!!i:(m!!i)| i<-[0..length x - 1]]


----------------------------------------------


--[[1,2,3,4],[5,6,7,8],[9,10,11,12]]

--[1,2,3,4] [[5,9],[6,10],[7,11],[8,12]]

--foldr ::(a -> b -> b) -> b -> [a] -> b 
--foldr f z [] = z 
--foldr f z (x:xs) = f x (foldr f z xs)


----------------------------------------------

--EJEMPLO PARA MATRIZ [[1,2],[3,4]] y vector [a,b]

--foldr (\mi rec-> \(xi:xs)-> (xi:mi):rec xs) (const []) [[1,2],[3,4]] 
--(\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [1,2] (foldr (\mi rec-> \(xi:xs)-> (xi:mi):rec xs) (const []) [[3,4]])
--(\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [1,2] ((\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [3,4] (foldr (\mi rec-> \(xi:xs)-> (xi:mi):rec xs) (const [])[]))

--(\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [1,2] ((\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [3,4] (const []))

--(\mi rec-> \(xi:xs)-> (xi:mi):rec xs) [1,2] ((\(xi:xs)-> (xi:[3,4]):(const []) xs))

--Aplicando la matriz me devuelve una funcion de [a]->[[a]]:
--(\(xi:xs)-> (xi:[1,2]):(\(xi:xs)-> (xi:[3,4]):(const []) xs) xs) 



--le aplico ahora a la funcion la lista [a,b]
--(\(xi:xs)-> (xi:[1,2]):(\(xi:xs)-> (xi:[3,4]):(const []) xs) xs) [a,b]

--(a:[1,2]):(\(xi:xs)-> (xi:[3,4]):(const []) xs) [b]
--(a:[1,2]):((b:[3,4]):(const []) [])
--(a:[1,2]):((b:[3,4]):[]) 
