todosMenosUltimo([A],[]).
todosMenosUltimo([E|Ls], M) :- todosMenosUltimo(Ls, T), append([E], T, M). 




/**
ultimo sin usar append:
ultimo([E], E).
ultimo([E|Ls], X) :- ultimo(Ls, X).

esta query devuelve un solo resultado. esta bien?
ultimo(X,3).
X = [3] 

ulimo usando todosMenosUltimo y append:
*/
ultimo(L, U) :- todosMenosUltimo(L, T), append(T, [U], L).

reverso([],[]).
reverso(L, R) :- todosMenosUltimo(L, T), reverso(T, RS), ultimo(L,U), append([U],RS,R).

prefijo(P, L) :- append(P,_,L).
sufijo(S, L) :- append(_,S,L).
/*
problema: el predicado sublista devuelve resultados repetidos.
*/

sublista([],L).
sublista(SUB,L) :- prefijo(P, L),  append(P, SUB, M), append(M, S, L), SUB \= [].

pertenece(X,L) :- sublista([X],L).





