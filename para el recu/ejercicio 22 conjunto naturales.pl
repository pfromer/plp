natural(cero).
natural(suc(X)) :- natural(X).
conjuntoDeNaturales(X) :- not(existeUnNoNatural(X)).
existeUnNoNatural(X) :- pertenece(E, X), not(natural(E)).
pertenece(E,X) :- member(E,X).


