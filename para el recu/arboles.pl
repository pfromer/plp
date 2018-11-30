vacio(nil).
arbol(nil).
arbol(bin(I,R,D)) :- arbol(I), arbol(D).

raiz(bin(I,R,D),R) :- arbol(I), arbol(D).

altura(nil,0).
altura(bin(I,R,D),N) :- altura(I,AI), altura(D,AD), maximo(AI, AD, MaxAltura), N is MaxAltura + 1.

cantidadDeNodos(nil,0).
cantidadDeNodos(bin(I,R,D),N) :- cantidadDeNodos(I,CI), cantidadDeNodos(D,CD), N is CI + CD + 1.

inorder(nil, []).
inorder(bin(I,R,D), L) :- inorder(I,II), inorder(D,ID), append(II, [R], Pref), append(Pref, ID, L).

arbolConInorder([],nil).
arbolConInorder([E|L],bin(nil,E,D)) :- arbolConInorder(L,D). 

aBB(nil).
aBB(bin(I,R,D)) :- aBB(I), aBB(D), todosSonMasChicos(I,R), todosSonMasGrandes(D,R).

todosSonMasChicos(nil,X).
todosSonMasChicos(bin(I,R1,D), X) :- R1 < X, todosSonMasChicos(I,X), todosSonMasChicos(D,X).

todosSonMasGrandes(nil,X).
todosSonMasGrandes(bin(I,R1,D), X) :- R1 > X, todosSonMasGrandes(I,X), todosSonMasGrandes(D,X).


maximo(A,B,M) :- A >= B, M is A.
maximo(A,B,M) :- A < B, M is B.


aBBInsertar(R, nil, bin(nil,R,nil)).
aBBInsertar(X,bin(I,R,D),A) :- var(A), inorder(bin(I,R,D),L), insertarOrdenado(X,L,L2), arbolConInorder(L2,A).
aBBInsertar(X,A,bin(I,R,D)) :- var(A), inorder(bin(I,R,D),L), quitar(X,L,L2), arbolConInorder(L2,A).



insertarOrdenado(E,[],[E]).
insertarOrdenado(E,[E2|L],[E|[E2|L]]) :- E < E2.
insertarOrdenado(E,[E2|L],[E2|L2]) :- E > E2, insertarOrdenado(E,L,L2).

quitar(X,[],[]).
quitar(X,[E|L],L) :- X=E.
quitar(X,[E|L],[E|L2]) :- X\=E, quitar(X,L,L2).


 


/*
bin(bin(bin(nil,4,nil),2,bin(nil,5,nil)),1,bin(bin(nil,6,nil),3,bin(nil,7,nil)))
[1,2,3,4,5]

1
	2
		4
		5
	3
		6
		7*/