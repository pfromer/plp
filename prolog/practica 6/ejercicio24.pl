/*
arbol(nil).
arbol(bin(nil,V2,bin(T,V1,T2))) :- arbol(T), arbol(T2).
arbol(bin(T,V1,T2),V2,nil) :- arbol(T), arbol(T2).
arbol(bin(T,V,T2)) :- arbol(T), arbol(T2).
*/

arbol(nil).
arbol(bin(T,V2,nil)) :- arbol(T).
