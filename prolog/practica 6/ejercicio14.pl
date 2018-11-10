
desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.

coprimos(X,Y) :- armarPares(X,Y), gcd(X,Y) =:= 1.
armarPares(X,Y) :- desde(1,S), between(1,S,X), Y is S - X + 1.



cuadradoSemiLatino(N, XS) :- desde(0,X), mListasDeDimensionNQueQueSumanX(N,X,N,XS). 

sumatoria([],0).
sumatoria([E|Ls], X) :- sumatoria(Ls, SumLs), X is E + SumLs.

/*
No OLVIDAR DE ACLARAR M DISTINTO  DE 0!!!!!!!!!!
*/
mListasDeDimensionNQueQueSumanX(0,X,N,[]).
mListasDeDimensionNQueQueSumanX(M,X,N,[L|Xs]) :- M =\= 0,  unaListaQueSumaXDeDimensionN(X, N, L), M2 is M-1, mListasDeDimensionNQueQueSumanX(M2, X, N, Xs). 


unaListaQueSumaXDeDimensionN(X, 1, [X]).
unaListaQueSumaXDeDimensionN(X, N, [E|Ls]) :- N =\= 1,  between(0, X, E), Rest is X - E, N2 is N-1, unaListaQueSumaXDeDimensionN(Rest, N2, Ls), sumatoria([E|Ls], X). 
 
 
