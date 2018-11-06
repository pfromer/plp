concatenar([],X,X).
concatenar([X|Y],Z,[X|W]) :- concatenar(Y,Z,W).