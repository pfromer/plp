

relacion(A,B,[]).
relacion(A,B,L) :-  subconjuntoDe(A,S1), subconjuntoDe(B,S2), armarPares(S1,S2,L).


armarPares([],_,[]).
armarPares([E|L1],B,P) :- eConTodosLosDeB(E,B,EconB), armarPares(L1,B,P2), append(EconB,P2,P).

eConTodosLosDeB(E,[],[]).
eConTodosLosDeB(E,[E2|L],[(E,E2)|L2]) :- eConTodosLosDeB(E,L,L2). 



/*
este genera las permutaciones de los subconjuntos
*/
subconjuntoDe(L,S) :- length(L,LengthL), between(1,LengthL, LengthS), subconjuntoDeTamanoN(L,LengthS,S).


subconjuntoDeTamanoN(L,1,[E]) :- member(E,L). 
subconjuntoDeTamanoN(L,N,[E|S]) :- N \= 1, N2 is N-1, select(E,L,L2), subconjuntoDeTamanoN(L2,N2,S).



hayDosPermutacionesDelMismo(L) :- member(A,L), member(B,L), A\=B, aEsPermutacionDeB(A,B).

aEsPermutacionDeB([],[]).
aEsPermutacionDeB(A,B) :- length(A,LengthA), length(B,LengthB), LengthA=LengthB, not(hayUnaLetrasConDistintaCantidadDeAparicion(A,B)).

hayUnaLetrasConDistintaCantidadDeAparicion(A,B) :- member(E,A), aparicionesDeEEnA(E,A,CountA),
						aparicionesDeEEnA(E,B,CountB), CountA \= CountB.
						
aparicionesDeEEnA(E,[],0).
aparicionesDeEEnA(E,[E2|L],N) :- E = E2, aparicionesDeEEnA(E,L,N2), N is N2 + 1.
aparicionesDeEEnA(E,[E2|L],N) :- E \= E2, aparicionesDeEEnA(E,L,N).
