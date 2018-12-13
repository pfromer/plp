subconjuntoDe(_,[]).
subconjuntoDe(L,[X|XS]) :- append(_,[X|Resto],L), subconjuntoDe(Resto,XS).

