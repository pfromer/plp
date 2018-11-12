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
		
iesimo(L, 0, X) :- head(L,X).		
iesimo([E|Ls],I,X) :- I \= 0, I2 is I-1, iesimo(Ls, I2, X). 
		
		
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
				subconjuntosN(N, L, SubConjL),
				arbolInstanciado(SubConjL, ArbolSinInstanciar, X).



/*
ahora funciona bien. instancia un solo arbol. desde arriba le paso la estructura y como quiero que lo instancie.
la cantidad de nodos del arbol ya coincide con la cantidad de elementos de la lista 
*/				
arbolInstanciado([], nil, nil).
arbolInstanciado(L, bin(Left,V,Right), bin(LeftInstanciado,E,RightInstanciado)) :- L\=[],
																					cantidadNodos(Left, NodosLeft),
																					prefijo(P, L), length(P, NodosLeft),
																					arbolInstanciado(P, Left, LeftInstanciado),
																					iesimo(L, NodosLeft, E), 
																					cantidadNodos(Right, NodosRight),
																					sufijo(S, L), length(S, NodosRight),
																					arbolInstanciado(S, Right, RightInstanciado).
																					











