preorder(nil,[]).
preorder(bin(I,R,D), [R|L]) :- app(LI,LD,L), preorder(I,LI), preorder(D,LD).
app([],YS,YS).
app([X|XS],YS,[X|L]) :- app(XS,YS,L).