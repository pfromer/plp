/*
esNodo(+G,?X)
esArista(+G,?X,?Y)
caminoSimple(+G,+D,+H,?L)
*/




esNodo(G,X) :- append([Nodos],_,G), member(X,Nodos).
esArista(G,X,Y) :- append(_,[Aristas],G), member([X,Y],Aristas).
esArista(G,X,Y) :- append(_,[Aristas],G), member([Y,X],Aristas).

caminoSimple(G,Start,End,L) :- buscarCaminosSimples(G,Start,End,L,[]).

buscarCaminosSimples(G,Start,End,[End],_) :- esNodo(G,Start), Start = End.
buscarCaminosSimples(G,Start,End,[Start|L],NodosYaVisitados) :- esNodo(G,Start), Start \= End,
																esArista(G, Start, X), 
																not(member(X,NodosYaVisitados)),
																append(NodosYaVisitados,[X],NodosYaVisitados2),																
																buscarCaminosSimples(G, X, End,L,NodosYaVisitados2),
																sinRepetidos([Start|L]).
																
sinRepetidos([]).
sinRepetidos([E|L]) :- not(member(E,L)), sinRepetidos(L).















/*

caminoSimple(G,Start,End,L) :- ground(L), head(L,Start), append(_,[End],L), esCaminoSimple(G,L).
caminoSimple(G,Start,End,L) :- var(L), generarCaminosDesdeStart(G,Start,End,L,[]), esCaminoSimple(G,Start,End,L).


esCaminoSimple(G,[E|[]]) :- esNodo(G,E).
esCaminoSimple(G,[E|[E2|L]]) :- not(member(E,[E2|L]), esArista(G,E,E2), esCaminoSimple(E,[E2|L]).


 
generarCaminosDesdeStart(G,Start,End,[Start,End]) :- 	esArista(G,Start,End).
generarCaminosDesdeStart(G,Start,End,[Start|[X|L]]) :-	esArista(G,Start,X), 
														generarCaminosDesdeStart(G,X,End,L).
														
														
generarCaminosDesdeStart(G,Start,End,[Start,End],_) :-  esArista(G,Start,End).
generarCaminosDesdeStart(G,Start,End,[Start|[X|L]], Vistos) :- 

*/