permutacion([],[]).
permutacion([E|Ls], X) :- length(Ls, Len), permutacion(Ls,Ls2), between(0, Len, L), prefijo(P,Ls2), length(P,L), sufijo(S,Ls2), L2 is Len-L, length(S, L2), append(P, [E], M), append(M, S, X). 

prefijo(P, L) :- append(P,_,L).
sufijo(S, L) :- append(_,S,L).

sufijoTamanoN(N,L,S) :- sufijo(S, L), length(S, N).

desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.

arbol(nil).
arbol(A) :- desde(0,X), todosLosArbolesDeNNodos(X, A). 

todosLosArbolesDeNNodos(0, nil).
todosLosArbolesDeNNodos(N, bin(A,V,nil)) :- N > 0, N2 is N-1, todosLosArbolesDeNNodos(N2, A), A\=nil.
todosLosArbolesDeNNodos(N, bin(nil,V,A)) :- N > 0, N2 is N-1, todosLosArbolesDeNNodos(N2, A).

/*
problema: genera instnacias repetidas
*/
nodosEn(A, L) :- length(L, LengthL), between(0, LengthL, N), todosLosArbolesDeNNodos(N, AN), aInstanciado(L, AN, A).
				
cantidadNodos(nil, 0).
cantidadNodos(bin(L,V,R),X) :- cantidadNodos(L, CL), cantidadNodos(R, CR), X is CL + CR + 1.

head([E|Ls], E).
tail([E|Ls], Ls).

				
aInstanciado([], A, nil).
aInstanciado(L, nil, nil) :- L\=[].
aInstanciado(L, bin(T1,V,T2), bin(TR1,E,TR2)) :- L\=[], permutacion(L,LPermutado), head(LPermutado,E), tail(LPermutado,Ls),
													T1 \= nil, aInstanciado(Ls,T1, TR1),
													cantidadNodos(TR1, N), length(Ls,LengthLs), 
													N2 is LengthLs - N, sufijoTamanoN(N2,Ls,S),
													aInstanciado(S,T2,TR2).
aInstanciado(L, bin(nil,V,T), bin(nil,E,TR)) :- L\=[], permutacion(L,LPermutado), head(LPermutado,E), tail(LPermutado,Ls),
												aInstanciado(Ls, T, TR).



