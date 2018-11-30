desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

listaPositiva(L) :- desde(1,X), todasLasListasQueSumanN(X,L).


todasLasListasQueSumanN(0,[]).
todasLasListasQueSumanN(N,[E|L]) :- between(1,N,E), N2 is N-E, todasLasListasQueSumanN(N2,L).

concatenar([],L,L).
concatenar([X|Xs],Z,[X|L]) :- concatenar(Xs,Z,L).

ultimo(L,U) :- concatenar(M,[U],L).

reverso([],[]).
reverso([E|L],R) :- reverso(L,R2), concatenar(R2,[E],R).

sublista([],L).
sublista(S,L) :- concatenar(P,_,L), concatenar(_,Sufijo,L), concatenar(P,S,L1), concatenar(L1,Sufijo, L), S\=[].

/*
prefijo + sublista + sufijo = L

[1,2,3,4]

[1]
[2]
[3]
[4]
[1,2]
[2,3]
[3,4]
[1,2,3]
[2,3,4]
[1,2,3,4]

*/