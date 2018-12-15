g(X,Y) :- p(X), q(Y), r(X,Y).
q(a).
q(c).
p(a).
p(b).
p(c).
r(X,Y) :- p(X),!, p(Y).
r(b,c).
r(b,d).
 


hombre(juan).
hombre(pedro).
mujer(X) :- not(hombre(X)).
mujer(caro).

/**


si pongo el cut asi:
r(b,c) :- !.

entonces no sale b,d como unificacion de x,y en la cosulta r(x,y).
esto afecta solamente a la consulta r(x,y) y no afecta a la consulta g(x,y) ya que de todas maneras p(b), q(d) no unfica.

si pongo el cut asi 
r(X,Y) :- !,p(X), p(Y).

esto hace que se elimine el resultado b,c repetido en g(X,Y)

no es posible insertar un cut en el predicado de r(x,y) de manera que afecte al conjunto de soliuciones de g(x,y)
la razon es que dentro del predicado g(x,y) cuando se llama a r(x,y), las dos variables ya estan instanciadas. y para 
todas las combinaciones r(x,y) devuelve true.
dado que el cut solo afecta al backtracking, es decir a la posibilidad de dar mas de un resultado, entonces, daod que las variables
ya estan instnaciadas solos nos imoprta si al menos una forma de unificar, o sea con que haya un solo resultado alzanca
para devolver true. por eso no hay forma de que afecte al conjunto de soluciones. a lo sumo se evitan repetidos.



*/