type Conj a = (a->Bool) 

vacio :: Conj a
vacio = (\x -> False) 

agregar :: Eq a => a -> Conj a -> Conj a
agregar e c = (\x -> x == e || c e) 

--intersecci´on y uni´on (ambas de tipo Conj a -> Conj a-> Conj a).

interseccion :: Conj a -> Conj a-> Conj a
interseccion c1 c2 = (\x -> (c1 x) && (c2 x))

union :: Conj a -> Conj a-> Conj a
union c1 c2 = (\x -> (c1 x) || (c2 x))

--iii. Deﬁnir un conjunto de funciones que contenga inﬁnitos elementos, y dar su tipo.

type ConjuntoInfinitoDeFunciones = Conj (Int->Int->Int)
miConjuntoInfinito :: ConjuntoInfinitoDeFunciones
miConjuntoInfinito = (\f -> f 2 5 > 3)

--iv. Deﬁnir la funci´on singleton :: Eq a => a -> Conj a, que dado un valor genere un conjunto con ese valor como u´nico elemento.

singleton :: Eq a => a -> Conj a
singleton e = (\x -> x == e)

--v. ¿Puede deﬁnirse un map para esta estructura? ¿De qu´e manera, o por qu´e no?
--supongamos que tengo una funcion f, un conjunto c y quiero poder mapearlo a un conjunto c2 de forma tal que los elementos de c2 son los elementos
--de c evaluados en f
--para construir c2 necesitpo una funcion que me diga si un elemento a pertenece a c2. para saber esto necesito saber si existe algun elemento b en c1
--tal que f(b) == a
--pero como no puedo preguntar por todos los elementos que hay en c no puedo saber si existe ese elemento b.
--la otra seria poder calcular g (inversa de f) y entonces dado a, calculo g(a) (cuyo resultado es b por ser inversa de f) y pregunto si b esta en c.
--pero como no hay forma de calcular la inversa de una funcion dinamicamente, tampoco lo puedo hacer. 

--Ejemplo: Conjunto A = {2,8,10}

--quiero mapearlo por medio de la funcion toString al conjunto {"2","8","10"}





