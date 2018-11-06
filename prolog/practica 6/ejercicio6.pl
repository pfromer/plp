/*
aplanar([],[]).
aplanar(L, A) :- primerElemento(L,E2), ultimosElementosSinAplanar(L,Ls2), aplanar(Ls2, Ls3), append([E], Ls3, A).
*/

esUnaLista([]).
esUnaLista([E|Ls]) :- esUnaLista(Ls).

primerElemento([X],X).
primerElemento([E|Ls],E) :- not(esUnaLista(E)).
primerElemento([E|Ls],X) :- primerElemento(E,X). 







