preoder(nil,[]).
preorder(bin(I,R,D),[R|L]) :- append(LI,LD,L),preorder(I,LI), preorder(D,LD).
append([],YS,YS).
append([X|XS],YS,[X|L]) :- append(XS,YS,L).