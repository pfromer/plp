funcionizar::Eq a =>[a]->[b]->a->Maybe b
funcionizar l1 l2 a = if (member (take (min (length l1) (length l2)) l1 )  a) then Just (l2 !! (position (take (min (length l1) (length l2)) l1 )  a)) else Nothing

position::Eq a =>[a]->a->Int
position (b:xs) a  = if (a == b) then 0 else 1 + position xs a 
position [] a = 0

member::Eq a =>[a]->a->Bool
member l a = foldr (\ x rec -> if x == a then True else False || rec ) False l


{-|


foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f z [] = z
foldl f z (x : xs) = foldl f (f z x) xs


position ['a','b','c'] 'b'
foldl (\rec x-> if 'b' == x then rec else 1 + rec) 0  ['a','b','c']
foldl (\rec x-> if 'b' == x then rec else 1 + rec)((\rec x-> if 'b' == x then rec else 1 + rec) 0 'a')['b','c']
foldl (\rec x-> if 'b' == x then rec else 1 + rec) (1) ['b','c']
foldl (\rec x-> if 'b' == x then rec else 1 + rec) ((\rec x-> if 'b' == x then rec else 1 + rec) 1 'b') ['c']
foldl (\rec x-> if 'b' == x then rec else 1 + rec) (2) ['c']

-}