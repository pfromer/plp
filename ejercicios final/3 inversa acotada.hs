funcionizar::Eq a =>[a]->[b]->a->Maybe b
funcionizar l1 l2 a = if (member (take (min (length l1) (length l2)) l1 )  a) then Just (l2 !! (position (take (min (length l1) (length l2)) l1 )  a)) else Nothing

position::Eq a =>[a]->a->Int
position (b:xs) a  = if (a == b) then 0 else 1 + position xs a 
position [] a = 0

member::Eq a =>[a]->a->Bool
member l a = foldr (\ x rec -> if x == a then True else False || rec ) False l


inversaAcotada::Eq b =>(a->b)->[a]->b->Maybe a
inversaAcotada f l = funcionizar (map f l) l