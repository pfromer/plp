esUnaLista([]).
esUnaLista([E|Ls]) :- esUnaLista(Ls).

aplanar([],[]).
aplanar([E|Ls],A) :- not(esUnaLista(E)), aplanar(Ls, Ls2), append([E], Ls2, A).
aplanar([E|Ls],A) :- esUnaLista(E), aplanar(E, E2), aplanar(Ls, Ls2), append(E2, Ls2, A).  


