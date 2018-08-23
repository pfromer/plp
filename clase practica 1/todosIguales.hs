todosIguales :: Eq a => [a] -> Bool
todosIguales [] = True
todosIguales (x:xs) = todosSonIgualesA x xs

todosSonIgualesA :: Eq a => a -> [a] -> Bool
todosSonIgualesA y [] = True
todosSonIgualesA y (x:xs) = y == x && todosSonIgualesA y xs

 