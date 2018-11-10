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

inorder(nil, []).
inorder(bin(L,V,R), List) :- inorder(L, LeftList), inorder(R, RightList), append(LeftList,[V], PreFijo), append(PreFijo, RightList, List).

arbolConInorder([], nil).
arbolConInorder([E|Ls], bin(nil,E,Left)) :- arbolConInorder(Ls, Left).


allAreSmaller([], V).
allAreSmaller([E|Ls], V) :- E < V, allAreSmaller(Ls, V).

allAreGreater([], V).
allAreGreater([E|Ls], V) :- E > V, allAreGreater(Ls, V).

aBB(nil).
aBB(bin(L,V,R)) :- inorder(L, LeftList), inorder(R, RightList), allAreSmaller(LeftList, V), allAreGreater(RightList, V), aBB(L), aBB(R).  

aBBInsertar(X, T1, T2) :- var(T2), inorder(T1, T1List), insertarOrdenado(X, T1List, LOrdenada), arbolConInorder(LOrdenada, T2).
aBBInsertar(X, T1, T2) :- var(X), nonvar(T2), inorder(T1, T1List), inorder(T2, T2List), subtract(T2List, T1List, Diff), length(Diff, 1), append([X], [], Diff).
aBBInsertar(X, T1, T2) :- var(T1), nonvar(X), nonvar(T2), inorder(T2, T2List), subtract(T2List, [X], Diff), arbolConInorder(Diff, T1).


insertarOrdenado(E, [], [E]).
insertarOrdenado(E, [E2|Ls], L) :- E < E2, append([E], [E2|Ls], L).
insertarOrdenado(E, [E2|Ls], L) :- E >= E2, insertarOrdenado(E, Ls, LsOrdenada), append([E2], LsOrdenada, L).

