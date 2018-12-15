1 vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
2 vecino(X, Y, [X|[Y|Ls]]).


3 vecino(1,V,[4,1,2,1,3]).


p1
vecino(1,V,[1,2,1,3]). (4: de 3 y 1)

p2
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p2
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p4
vecino(1,V,[3]). (7: de 6 y 1)
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p5
vecino(1,V,[]). (8: de 6 y 1)
vecino(1,V,[3]). (7: de 6 y 1)
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p6
pop de clausula 8 porque no unifica con ninguna
vecino(1,V,[3]). (7: de 6 y 1)
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p7
pop de clausula 7 porque no unifica
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p8
{} clausula vacia de unificar 6 con 2
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)


p10
pop de clausula vacia
vecino(1,V,[1,3]). (6: de 5 y 1)
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p10
pop de clausual 6 porque no unfica con ninguna mas
vecino(1,V,[2,1,3]). (5: de 4 y 1)
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p11
pop de clausua 5 porque no unfica con ninguna mas
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p10
{} clausua vacia de unificar 4 con 2
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p11
pop de clasua vacia
vecino(1,V,[1,2,1,3]).  (4: de 3 y 1)

p12
pop de clausua 4 porque no unifica con nada mas
