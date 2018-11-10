desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.

esCompatible(A,B,C) :- A =\= 0, A < B+C, A > abs(B - C).
esTriangulo(tri(A,B,C)) :- esCompatible(A,B,C), esCompatible(B,A,C), esCompatible(C,A,B).

/*
perimetro(tri(A,B,C), P) :- ground(tri(A,B,C)), esTriangulo(tri(A,B,C)), P is A + B + C.
perimetro(Tree, P) :- var(Tree), desde(3,P), PMinus2 is P-2, between(1, PMinus2, A), P2 is P-A, between(1, P2, B), C is P-B-A, esTriangulo(tri(A,B,C)), Tree is tri(A,B,C).
OJO que la segunda linea siempre daba false porque no podia unificar var(Tree) al mismo tiempo con Tree is tri(A,B,C).
*/


triangle(A,B,C,tri(A,B,C)) :- esTriangulo(tri(A,B,C)).

perimetro(tri(A,B,C), P) :- ground(tri(A,B,C)), esTriangulo(tri(A,B,C)), P is A + B + C.
perimetro(Tree, P) :- var(Tree), desde(3,P), PMinus2 is P-2, between(1, PMinus2, A), P2 is P-A, between(1, P2, B), C is P-B-A, triangle(A,B,C,Tree).  