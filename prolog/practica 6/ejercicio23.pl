esNodo(G,X)
esArista(G,X,Y)

caminoSimple(G,Start,End,[End]):- esNodo(G,Start), Start = End.
caminoSimple(G,Start,End,[Start|L]) :- esNodo(G,Start), Start \= End, esArista(G, Start, X), X\=Start,
										caminoSimple(G, X, End, L), sinRepetidos([Start|L]).
										
caminoHamiltoniano(G,L) :- esNodo(G,D), esNodo(G,H), caminoSimple(G,D,H,L), not(existeNodoEnGQueNoEstaEnL(G,L)).
existeNodoEnGQueNoEstaEnL :- esNodo(G,X), not(member(X,L)).						 
							 
sinRepetidos([]).
sinRepetidos([E|L]) :- not(member(E,L)), sinRepetidos(L).

esConexo(G) :- not(hayDosNodosDesconexos(G)).
hayDosNodosDesconexos(G) :- esNodo(G,D), esNodo(G,H), not(caminoSimple(G,D,H,L)).
							
esEstrella(G) :- esConexo(G), esNodo(G, E), esAristaConTodos(G,E).

esAristaConTodos(G,E) :- not(existeUnNodoQueNoEsAristaConE(G,E)).
existeUnNodoQueNoEsAristaConE(G,E) :- nodo(G,V), V \= E, not(esArista(G,E,V)). 					

/**
caminoSimple(G,D,H,L) :- puedoLlegar(G,D,H,L,[D]). 

puedoLlegar(G,D,H,[D], NodosUsados):- esNodo(G,D), D = H.
puedoLlegar(G,D,H,[D|L], NodosUsados) :- esNodo(G,D), D \= H, esArista(G, D, X),
										not(member(X, NodosUsados)), 
										puedoLlegar(G, X, H, L, [X|NodosUsados]), sinRepetidos([D|L]).
*/	