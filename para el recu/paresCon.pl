paresConX(_,[],[]).
paresConX(X,[Y|YS],[(X,Y)|PS]) :- paresConX(X,YS,PS).
paresConX(X,[_|YS],PS) :- paresConX(X,YS,PS).