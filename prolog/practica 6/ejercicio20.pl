diferenciaSimetrica(L1, L2, X) :- elementosEnL1PeroNoEnL2(L1, L2, L4),  elementosEnL1PeroNoEnL2(L2, L1, L5), append(L4, L5, X).


/*
Preguntgar que pasa con el not, si lo cambio de lugar, si lo pongo adelante. relacionarlo con el ejercicio 18.

*/
elementosEnL1PeroNoEnL2([], L2, []).
elementosEnL1PeroNoEnL2([E|Ls], L2, [E|L3]) :- elementosEnL1PeroNoEnL2(Ls, L2, L3), not(member(E,L2)).
elementosEnL1PeroNoEnL2([E|Ls], L2, L3) :- elementosEnL1PeroNoEnL2(Ls, L2, L3), member(E,L2).