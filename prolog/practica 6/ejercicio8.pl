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

reparto(L, 1, [L]).
reparto(L, N, [E|Ls]) :- N =\= 1, N2 is N-1, prefijo(P,L), sufijo(S,L), append(P,S,L), append(E,[],P), reparto(S, N2, Ls).

repartoSinVacias(L, LListas) :- length(L,LengthL), between(1, LengthL, LengthLListas), reparto(L, LengthLListas, LListas), not(member([], LListas)).      



/*elementosTomadosEnOrden(L,N,X)

borro este caso base porque me genera repetidos.
elementosTomadosEnOrden([],_,[]).*/
elementosTomadosEnOrden(_,0,[]).
elementosTomadosEnOrden(Ls,N,X) :- N =\= 0, sufijo(S,Ls), append(S,[],[SHead|Stail]), N2 is N-1, elementosTomadosEnOrden(Stail,N2,Ls2), append([SHead], Ls2, X), length(X, N).