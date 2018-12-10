desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.



cuadradoSemiLatino(N,X) :- desde(0,K), cuadradoSemiLatinoDeDimensionNMYLasFilasSumanK(N,N,K,X).


cuadradoSemiLatinoDeDimensionNMYLasFilasSumanK(N,0,K,[]).
cuadradoSemiLatinoDeDimensionNMYLasFilasSumanK(N,M,K,[X|Xs]) :- M\=0, listaDeTamanoNQueSumaK(N,K,X), M2 is M - 1, 
															cuadradoSemiLatinoDeDimensionNMYLasFilasSumanK(N,M2,K,Xs).
															
					
listaDeTamanoNQueSumaK(0,_,[]).
listaDeTamanoNQueSumaK(N,K,[X|Xs]) :- N\=0, between(0,K,X), K2 is K - X, N2 is N-1, listaDeTamanoNQueSumaK(N2,K2,Xs), sumatoria(Xs, K2).


sumatoria([],0).
sumatoria([E|L],S) :- sumatoria(L,S2), S is E + S2.


/*



Suman 0
[[0,0],[0,0]]

Suman 1
[[0,1],[0,1]]
[[0,1],[1,0]]
[[1,0],[0,1]]
[[1,0],[1,0]]


Suman 2
[[0,2],[0,2]]
[[0,2],[2,0]]
[[0,2],[1,1]]
[[2,0],[0,2]]
[[2,0],[2,0]]
[[2,0],[1,1]]
[[1,1],[0,2]]
[[1,1],[2,0]]
[[1,1],[1,1]]
*/