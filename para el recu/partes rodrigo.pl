relaciones(A, B, R) :- productoCartesiano(A, B, PC), partes(PC, R).

productoCartesiano([], _, []).
productoCartesiano([X|A], B, PC) :- relacionadoConTodes(X, B, TS), productoCartesiano(A, B, RS), append(TS, RS, PC).

relacionadoConTodes(_, [], []).
relacionadoConTodes(X, [Y|B], [[X, Y]| TS]) :- relacionadoConTodes(X, B, TS).

partes(C, C).
partes(C, [E]) :- member(E, C).
partes(C, PS) :- prefijo(P, C), sufijo(S, C), append(P, S, PS), length(C, N1), length(PS, N2), 2 =< N2, N2 < N1.

funcion(D, I, F) :- relaciones(D, I, F), esFuncion(F).

esFuncion([]).
esFuncion([[X,Y]|R]) :- not(hayOtro(X, Y, R)), esFuncion(R).

hayOtro(X, Y, R) :- member([X, Z], R), Z \= Y.

prefijo(P, C) :- append(P, _,C).
sufijo(S, C) :- append(_,S,C).