listasQueSuman:: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n = [x:l| x <- [1..n], l <- listasQueSuman (n-x)]

--ejercicio8


todasLasListasFinitasDeEnterosPositivos :: [[Int]]
todasLasListasFinitasDeEnterosPositivos = concat [ ls | x<-[1..], let ls = listasQueSuman x]