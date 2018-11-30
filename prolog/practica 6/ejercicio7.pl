prefijo(P, L) :- append(P,_,L).
sufijo(S, L) :- append(_,S,L).

palindromo(A,X) :- reverse(A,R), append(A,R,X).
iesimo(I, L , X) :- prefijo(P, L), length(P, I), append(P, [X], M), append(M,_, L).



