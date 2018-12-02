desde(X,X).
desde(X,Y) :- N is X + 1, desde(N,Y).


arbol(A) :- desde(0,N), arbolDeNNodos(N,A). 

arbolDeNNodos(0,nil).
arbolDeNNodos(N,bin(I,R,D)) :- N > 0, N2 is N-1, sumanN(X,Y,N2), arbolDeNNodos(X,I), arbolDeNNodos(Y,D).

sumanN(X,Y,N) :- between(0,N,X), between(0,N,Y), N is X+Y.


nodosEn(A,L) :- arbol(A), instanciar(A,L).
instanciar(nil,L).
instanciar(bin(I,R,D),L) :- member(R,L), instanciar(I,L), instanciar(D,L).


sinRepeEn(A,L) :-   length(L,LengthL), 
					between(0,LengthL,N), 
					arbolDeNNodos(N,A),
					subconjuntoN(N,L,S),
					instanciarEnOrden(A,S).
					

subconjuntoN(0,L,[]).
subconjuntoN(N,L,[E|L2]) :- N>0, member(E,L), subtract(L,[E],L3), N2 is N-1, subconjuntoN(N2,L3,L2).

instanciarEnOrden(nil,[]).
instanciarEnOrden(bin(I,R,D),[R|L]) :- 
									cantidadNodos(I,CI), 
									cantidadNodos(D,CD),
									append(P,S,L),
									length(P,CI),
									length(S,CD),
									instanciarEnOrden(I,P),
									instanciarEnOrden(D,S).
									
cantidadNodos(nil,0).
cantidadNodos(bin(I,R,D),N) :- cantidadNodos(I,CI), cantidadNodos(D,CD), N is 1 + CI + CD.


											



 