

/*
este genera las permutaciones de los subconjuntos
*/
subconjuntoDe(_,[]).
subconjuntoDe(L,[X|XS]) :- append(_,[X|Resto],L), subconjuntoDe(Resto,XS).


[X|Resto]:
[1,2,3]


[1|[]]
[1|[2,3]]
[1|[2]]
[1|[3]]


[X|Resto]:
[2,3]


[2|[]]
[2|[3]]


[X|Resto]:
[3]


[3]

[1|[2,3]]
[1|[2]]
[1|[3]]