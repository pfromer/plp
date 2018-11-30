coprimos(X,Y) :- armarPares(X,Y), gcd(X,Y) =:= 1.
armarPares(X,Y) :- desde(1,S), between(1,S,X), Y is S - X + 1.