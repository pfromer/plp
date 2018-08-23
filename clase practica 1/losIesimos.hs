module LosIesimos (losIesimos, shuffle) where 

losIesimos :: [Int] -> [[a] -> a]
losIesimos xs = map (flip (!!)) xs

shuffle :: [Int] -> [a] -> [a]
shuffle indexes list =  map (flip ($) list) (losIesimos indexes)
 


 {-|
map (flip ($) list) (lista de funciones donde cada funcion recibe una lista y devuelve el iesimo elemento segun lo que dice indxs)

map (flip ($) list) (f1:f2:f3:f4)

(flip ($) list f1) : (flip ($) list f2) : (flip ($) list f3): (flip ($) list f4) 

(f1 list) : (f2 list) : (f3 list): (f4 list) 
-}



{-|
map f [] = [] 
map f (x:xs) = (f x):(map f xs)



losIesimos [1,2,3] = 

map (flip (!!)) 1:[2,3] = 
((flip (!!)) 1) : map (flip (!!)) [2,3]= 
((flip (!!)) 1) : (map (flip (!!)) 2) : map (flip (!!)) [3] = 
((flip (!!)) 1) : (map (flip (!!)) 2) : (map (flip (!!))) 3 :  map (flip (!!)) [] =
 
((flip (!!)) 1) : ((flip (!!)) 2) : ((flip (!!))) 3 : []

-}

