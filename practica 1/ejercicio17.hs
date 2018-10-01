--Ejercicio 17 F i. 
--Deﬁnir y dar el tipo del esquema de recursi´on foldNat sobre los naturales. 
--Utilizar el tipo Integer de Haskell (la funci´on va a estar deﬁnida s´olo para los enteros mayores o iguales que 0).
--ii. Utilizando foldNat, deﬁnir la funci´on potencia.

foldNat :: (b->b)->Integer->b->b
foldNat f 0 z = z
foldNat f n z = f (foldNat f (n - 1) z)

potencia :: Integer -> Integer -> Integer
potencia x 0 = 1
potencia x y = foldNat (\i-> i*x) (y-1) x

{-|
potencia 3 4 = foldNat (i-> i*3) 3 3
foldNat (i-> i*3) 3 3
(i-> i*3) ((i-> i*3) ((i-> i*3) (foldNat (i-> i*3) 0 3))))

(i-> i*3) (27))

--3*3*3*3 
-}