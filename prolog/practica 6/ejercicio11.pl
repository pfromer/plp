/*

Ejercicio 11
Definir el predicado intercalar(L1, L2, L3), donde L3 es el resultado de intercalar uno a uno los elementos
de las listas L1 y L2. Si una lista tiene longitud menor, entonces el resto de la lista mas larga es pasado sin
cambiar. Indicar la reversibilidad, es decir si es posible obtener L3 a partir de L1 y L2, y viceversa.
Ejemplo: intercalar([a,b,c], [d,e], [a,d,b,e,c]).

intercalar([],L,L).
intercalar(L,[],L).
intercalar([E1|Ls],[E2|Ls2],X) :- intercalar(Ls,Ls2,ColasIntercaladas), append([E1], [E2], Prefijo), append(Prefijo, ColasIntercaladas, X).

*/







intercalar([],L,L).
intercalar(L,[],L) :- L\=[].
intercalar([X|Xs],[Y|Ys],[X|[Y|L]]):- intercalar(Xs,Ys,L).