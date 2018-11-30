esTriangulo(tri(A,B,C)) :- esCompatible(A,B,C), esCompatible(B,C,A), esCompatible(C,B,A).

esCompatible(A,B,C) :- A>0, B>0, C>0, Suma is B + C, A < Suma, Dif is abs(B - C), A > Dif. 

/*
ojo esto fallaba cuando hacia perimietro(T,10). porque unifica con, y despues al no estar instanciadas ni A, ni B, ni C falla.
perimietro(tri(A,B,C),N) :- esTriangulo(tri(A,B,C)), N is A + B + C.
*/

perimietro(T,N) :- nonvar(T), esTriangulo(T), triangulo(A,B,C,T), N is A + B + C.
perimietro(T,N) :- var(T), nonvar(N), sumanN(A,B,C,N), esTriangulo(tri(A,B,C)), triangulo(A,B,C,T).
perimietro(T,N) :- var(T), var(N), desde(3,N), sumanN(A,B,C,N), esTriangulo(tri(A,B,C)), triangulo(A,B,C,T).

triangulo(A,B,C,tri(A,B,C)).


desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).


sumanN(A,B,C,N) :- between(0,N,A), between(0,N,B), between(0,N,C), N is A + B + C.


triangulo(T) :- desde(3,N), sumanN(A,B,C,N), triangulo(A,B,C,T), esTriangulo(T).


corteMasParejo(L,L1,L2) :- append(L1,L2,L), sumatoria(L1, S1), sumatoria(L2, S2), Dif is abs(S1 - S2), not(existeOtroCorteMasParejo(L,L1,L2,Dif)).

existeOtroCorteMasParejo(L,L1,L2,Dif) :- append(L3,L4,L), sumatoria(L3, S3), sumatoria(L4, S4), Dif2 is abs(S3 - S4), Dif2 < Dif.

sumatoria([],0).
sumatoria([E|L], N) :- sumatoria(L, N2), N is E + N2.


diferenciaSimetrica(L1,L2,L3) :- union(L1,L2,U), intersection(L1,L2,I), subtract(U,I,L3).


maxP(X) :- p(X), not(hayOtroMasGrande(X,Y)).
hayOtroMasGrande(X,Y) :- p(X), p(Y), Y > X.

p(1).
p(2).
p(4).









