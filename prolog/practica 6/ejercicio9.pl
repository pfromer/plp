/*elementosTomadosEnOrden(L,N,X)

borro este caso base porque me genera repetidos.
elementosTomadosEnOrden([],_,[]).*/
elementosTomadosEnOrden(_,0,[]).
elementosTomadosEnOrden(Ls,N,X) :- N =\= 0, sufijo(S,Ls), append(S,[],[SHead|Stail]), N2 is N-1, elementosTomadosEnOrden(Stail,N2,Ls2), append([SHead], Ls2, X), length(X, N).