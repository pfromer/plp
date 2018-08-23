mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f [] = undefined
mejorSegun f (x:xs) = mejorSegunAux f x xs

mejorSegunAux :: (a -> a -> Bool) -> a -> [a] -> a
mejorSegunAux f a xs | length xs == 0 = a
mejorSegunAux f a (x:xs) | f a x = mejorSegunAux f a xs
mejorSegunAux f a (x:xs) | f x a = mejorSegunAux f x xs

maximo :: [Int] -> Int
maximo = mejorSegun (\x y -> x > y)

listaMasCorta :: [[a]] -> [a]
listaMasCorta = mejorSegun (\x y -> length x <= length y)