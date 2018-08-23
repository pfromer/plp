module ReverseAnidado (reverseAnidado) where 
import LosIesimos

reverseAnidado :: [[Char]] -> [[Char]]
reverseAnidado ls = shuffle [(length ls) - 1, (length ls - 2)..0] (map (\x -> shuffle [(length x) - 1,(length x) - 2 ..0] x ) ls ) 


 {-|
reverseAnidado xxs = reverse (map reverse xxs) 
-}