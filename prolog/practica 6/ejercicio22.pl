pertenece(X, C) :- member(X, C).

natural(cero).
natural(suc(X)) :- natural(X).

conjuntoDeNaturales(X) :- not(existeUnNoNaturalEnC(X)).	


existeUnNoNaturalEnC(C) :- pertenece(E, C), not(natural(E)).


conjuntoDeNaturalesMalo(X) :- not((not(natural(E)), pertenece(E,X))).
/*

la definidcion ultima es mala porque not(natural(E)) siempre da falso, ya que existen naturales E, entonces todo lo de adentro del not de mas afuera siemrpe da verdadero
por lo tando para cualqueir conjunto X conjuntoDeNaturalesMalo(X) es siemrpe verdadero
*/