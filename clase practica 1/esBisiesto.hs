esBisiesto :: Int -> Bool
esBisiesto a | mod a 4 /= 0 = False
esBisiesto a | mod a 100 == 0 && mod a 400 /= 0 = False
esBisiesto a | otherwise = True