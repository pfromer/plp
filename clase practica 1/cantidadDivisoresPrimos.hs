cantidadDivisoresPrimos :: Int -> Int
cantidadDivisoresPrimos a | a < 1 = undefined
cantidadDivisoresPrimos a | otherwise = length (filter (\x -> esPrimo x && mod a x == 0) [1..a])

esPrimo :: Int -> Bool
esPrimo a | a <= 1 = False
esPrimo a | otherwise = length (filter (\x -> mod a x == 0) [2..(a-1)]) == 0


