partir :: [a] -> [([a], [a])]
partir l = [(l1,l2)| x<-[0..length l], let l1 = take x l, let l2 = drop x l]



--drop 4 . take 9 $ [1,2,3,4,5,6,7,8,9,0]
--[5,6,7,8,9]