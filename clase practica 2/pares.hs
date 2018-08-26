pares :: [(Int, Int)]
pares = [(x,n-x) | n<-[0..], x<-[0..n]]