paresCuadrados :: [Int] -> [Int]
paresCuadrados xs = map (\x -> x*x) (filter even xs)
