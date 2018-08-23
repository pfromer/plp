factorial :: Int -> Int
factorial a | a < 0 = undefined
factorial a | elem a [0,1] = 1
factorial a | otherwise = a * factorial (a - 1)