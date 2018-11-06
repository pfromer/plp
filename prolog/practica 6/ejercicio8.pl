interseccion([],M,[]).
interseccion([E|Ls],M,I) :- member(E,M), interseccion(Ls, M, I2), append([E],I2, I).
interseccion([E|Ls],M,I) :- not(member(E,M)), interseccion(Ls, M, I).


prefijo(P, L) :- append(P,_,L).
sufijo(S, L) :- append(_,S,L).

separar(N, L, L1, L2) :- prefijo(L1,L), length(L1,N), append(L1,L2,L).

borrar([], X, []).
borrar([E|Ls], X, M) :- E =:= X, borrar(Ls, X, M). 
borrar([E|Ls], X, M) :- E =\= X, borrar(Ls, X, Ls2), append([E], Ls2, M). 


sacarDuplicados([], []).
sacarDuplicados([E|Ls], M) :- member(E,Ls), sacarDuplicados(Ls, M).
sacarDuplicados([E|Ls], M) :- not(member(E,Ls)), sacarDuplicados(Ls, Ls2), append([E], Ls2, M). 

permutacion([],[]).
permutacion([E|Ls], X) :- length(Ls, Len), permutacion(Ls,Ls2), between(0, Len, L), prefijo(P,Ls2), length(P,L), sufijo(S,Ls2), L2 is Len-L, length(S, L2), append(P, [E], M), append(M, S, X). 