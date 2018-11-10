tree(nil).
tree(bin(L,X,R)) :- tree(L), tree(R).

vacio(nil).
raiz(bin(L, X, R),X).

maximo(X,Y,X) :- X >= Y.
maximo(X,Y,Y) :- X < Y.

altura(nil, 0).
altura(bin(L,V,R), X) :- altura(L, AL), altura(R, AR), AL2 is AL + 1, AR2 is AR + 1, maximo(AR2, AL2, X).

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(L,V,R),X) :- cantidadDeNodos(L, CL), cantidadDeNodos(R, CR), X is CL + CR + 1.