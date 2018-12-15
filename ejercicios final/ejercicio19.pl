g(X,Y) :- p(X), q(Y), r(X,Y).
q(a).
q(c).
p(a).
p(b).
p(c).
r(X,Y) :- p(X),p(Y).
r(b,c) :- !.
r(b,d).