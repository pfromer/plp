quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (y:ys) = (quickSort (filter (\x -> x < y) ys)) ++ y:quickSort (filter (\x -> x > y) ys)

 {-|
 otra opcion con ++
 
 quickSort (y:ys) = quickSort (filter (\x -> x < y) ys) ++   [y] ++ quickSort (filter (\x -> x > y) ys)
-}