add(U, 0, U).
add(X,succ(Y),succ(Z)) :- add(X,Y,Z).



Si instancio los tres me tiene que dar true o fasle.
Si instancio dos hay una sola solucion y me la devuelve o me da false si no existe.

si instancio uno solo y no pongo una unificacion imposible me da las infinitas soluciones

(por ejemplo add(succ(0), X, X) no tiene solucion y se cuelga)

si no instancio ninguno me da infinitas soluciones.

si pongo el cut al final no me da infinitas soluciones pero no cambia lo anterior.