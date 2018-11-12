/*
--------------------Funciones auxiliares--------------
*/

permutacion([],[]).
permutacion([E|Ls], X) :- length(Ls, Len), permutacion(Ls,Ls2), between(0, Len, L), prefijo(P,Ls2), length(P,L), sufijo(S,Ls2), L2 is Len-L, length(S, L2), append(P, [E], M), append(M, S, X). 

prefijo(P, L) :- append(P,_,L).
sufijo(S, L) :- append(_,S,L).

sufijoTamanoN(N,L,S) :- sufijo(S, L), length(S, N).

desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.

cantidadNodos(nil, 0).
cantidadNodos(bin(L,V,R),X) :- cantidadNodos(L, CL), cantidadNodos(R, CR), X is CL + CR + 1.

head([E|Ls], E).
tail([E|Ls], Ls).

subconjuntosN(N, [], []).
subconjuntosN(0, L, []) :- L \= [].					
subconjuntosN(N,L,[E|Ls]) :-  N =\= 0, L \= [], member(E,L), N2 is N-1, subtract(L,[E],L2), subconjuntosN(N2, L2, Ls).				
		

/*
----------------------------Item I-----------------------------------
*/

arbol(A) :- desde(0,X), todosLosArbolesDeNNodos(X, A). 

todosLosArbolesDeNNodos(0, nil).
todosLosArbolesDeNNodos(N, bin(A,V,nil)) :- N > 0, N2 is N-1, todosLosArbolesDeNNodos(N2, A), A\=nil.
todosLosArbolesDeNNodos(N, bin(nil,V,A)) :- N > 0, N2 is N-1, todosLosArbolesDeNNodos(N2, A).

/*
----------------------------Item II-----------------------------------
*/
nodosEn(A, L) :- desde(0, N), todosLosArbolesDeNNodos(N, ArbolSinInstanciar), 
				arbolConNodosRepetidos(L, ArbolSinInstanciar, A).

												
										
arbolConNodosRepetidos(L,nil,nil).
arbolConNodosRepetidos(L,bin(Left,V,Right), bin(LeftInstanciado,E,RightInstanciado)) :- member(E,L), arbolConNodosRepetidos(L,Left,LeftInstanciado), arbolConNodosRepetidos(L,Right,RightInstanciado).


/*
----------------------------Item III-----------------------------------
*/
sinRepeEn(X, L) :- length(L, LengthL), between(0, LengthL, N), todosLosArbolesDeNNodos(N, ArbolSinInstanciar), 
				arbolInstanciado(L, ArbolSinInstanciar, X).
						
arbolInstanciado([], nil, nil).
arbolInstanciado(L, bin(Left,V,Right), bin(LeftInstanciado,E,RightInstanciado)) :- L\=[],cantidadNodos(Left, CantidadNodosArbolT1), 
												CN2 is CantidadNodosArbolT1 + 1,
												subconjuntosN(CN2, L, SubConj),
												head(SubConj,E), tail(SubConj,Ls),
												arbolInstanciado(Ls,Left,LeftInstanciado),
												subtract(L,SubConj,Subtracted),
												cantidadNodos(Right, N2), subconjuntosN(N2,Subtracted,S),
												arbolInstanciado(S,Right,RightInstanciado).