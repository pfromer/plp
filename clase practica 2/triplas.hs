triplas :: [(Int, Int, Int)]
triplas = [(x,y,n-x-y) | n<-[0..], x<-[0..n], y<-[0..n-x]]