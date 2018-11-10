p(a).
p(b).
p(c).


q(a).
q(d).

moreThanOneP :- p(X), p(Y), X \= Y.



/*
i. Sean los predicados P(?X) y Q(?X), >que signica la respuesta a la siguiente consulta?
?- P(Y), not(Q(Y)).

responde:
b
c



ii. >Que pasara si se invirtiera el orden de los literales en la consulta anterior?
devuelve false.

iii. Sea el predicado P(?X), >Como se puede usar el not para determinar si existe una unica Y tal que P(?Y)
es verdadero?

not(moreThanOneP).

*/
