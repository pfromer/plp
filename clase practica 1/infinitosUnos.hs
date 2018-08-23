infinitosUnos :: [Int] 
infinitosUnos = 1 : infinitosUnos

nUnos :: Int -> [Int] 
nUnos n = take n infinitosUnos