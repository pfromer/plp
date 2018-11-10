/*
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).


i. >Como deben instanciarse los parametros para que el predicado funcione? (Es decir, para que no se cuelgue
ni produzca un error). >Por que?

o bien los dos instanciados con el segundo mas grande, o bien el primero instnaciado solamente,
si el segudno es mas chico que el primero se cuelga.

*/

desde(X,X).
desde(X,Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y>X.
