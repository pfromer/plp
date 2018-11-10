/*
Ejercicio 21
Dado un predicado unario P sobre numeros naturales, defnir un predicado que determine el maaximo X que
satisfaga P(X).

*/


p(1).
p(5).
p(6).
p(8).
p(3).


maxP(X) :- p(X), not(hayOtroMasGrandeQueSatisfaceP(X,Y)).
hayOtroMasGrandeQueSatisfaceP(X, Y) :- p(X), p(Y), Y > X.

