soloPuntosFijos :: [Int -> Int] -> Int -> [Int -> Int]
soloPuntosFijos xs n = filter (\x -> x n == n) xs

 {-|
soloPuntosFijos [] n = []
soloPuntosFijos (x:xs) n = if x n == n then x:soloPuntosFijos xs n else soloPuntosFijos xs n
-}

