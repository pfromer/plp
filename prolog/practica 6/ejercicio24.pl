arbol(nil).
arbol(bin(nil,V,T)) :- arbol(bin(nil,V,T)), arbol(T).
arbol(bin(T,V,nil)) :- T\=nil, arbol(T).
arbol(bin(T,V,T2)) :- arbol(T), arbol(T2).