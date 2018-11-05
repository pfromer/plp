padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
padre(ramiro, fabian).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y), X\=Y.
descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(Z,Y), descendiente(X,Z).

ancestro(X, X).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).


/**
ancestro(juan, X)
	X <- juan. 
	ancestro(juan, Y) 
		ancestro(_z0, Y) ESTE POR AHORA SOLO LO RESUELVO CON PRIMERA LINREA
			_z0 <- Y. 
		padre(juan, Y)
			Y <- carlos
			Y <- luis	
			ancestro(z1, Y)
				Y <- z1. 
				ancestro(Y, Y)
			padre(z0, z1)



ancestro(juan, X)
	ancestro(juan, juan).
		X <- juan.
	ancestro(Z0, X), padre(juan, Z0).
		ancestro(Z0, Z0).
			X <- Z0.
			padre(juan, ZO)
				Z0 <- carlos.
					ancestro(carlos, X), padre(juan, carlos).
						ancestro(carlos, carlos)
							X <- carlos.							
				Z0 <- luis.
					ancestro(luis, X), padre(juan, luis).
						
	
ancestro(z0, X), padre(juan, z0)
	ancestro(z0, z0)
		X <- z0.
	padre(juan, z0)
		z0 <- carlos.
		z0 <- luis.
		


iii Dibujar el ´arbol de b´usqueda de Prolog para la consulta descendiente(Alguien, juan).

descendiente(Alguien, juan).
	hijo(Alguien, juan).
		padre(juan, Alguien).
			Alguien <- carlos.
			Alguien <- luis.
	hijo(z0, juan), descendiente(Alguien, z0).
		padre(juan, z0)
			z0 <- carlos.
				descendiente(Alguien, carlos).
					hijo(Alguien, carlos).
						padre(carlos, Alguien).
							Alguien <- daniel.
							Alguien <- diego.
					hijo(z1, carlos), descendiente(Alguien,z1)
						padre(carlos, z1)
							z1 <- daniel.
								descendiente(Alguien, daniel)
									hijo(Alguien, daniel)
										padre(daniel, Alguien)
											false.
							z1 <- diego.
								descendiente(Alguien, diego)
									hijo(Alguien, diego)
										padre(diego, Alguien)
											false.
					
			z0 <- luis.
				descendiente(Alguien, luis)
					hijo(Alguien, luis)
						padre(luis, Alguien)
							Alguien <- pablo
							Alguien <- manuel
							Alguien <- ramiro
					hijo(z2, luis), descendiente(Alguien, z2)
						padre(luis, z2)
							z2 <- pablo
								descendiente(Alguien, pablo)
									hijo(Alguien, pablo)
										padre(pablo, Alguien)
											false									
									hijo(z4, pablo), descendiente(Alguien, z4)
										false
							z2 <- manuel
								descendiente(Alguien, manuel)
									hijo(Alguien, manuel)
										padre(manuel, Alguien)
											false									
									hijo(z5, manuel), descendiente(Alguien, z5)
										false
							z2 <- ramiro
								descendiente(Alguien, ramiro)
									hijo(Alguien,ramiro).
										padre(ramiro, Alguien)
											Alguien <- Fabian
									hijo(z6,ramiro), descendiente(Alguien,z6).
										padre(ramiro, z6)
											Z6<-Fabian
												descendiente(Alguien,Fabian)
													hijo(Alguien, Fabian)
														Padre(Fabian, Alguien)
															false.
													hijo(z7,Fabian), descendiente(Alguien,z7).
														padre(Fabian, z7)
															false.









juan
	carlos
		daniel
		diego
	luis
		pablo
		manuel
		ramiro
			fabian

			
			
			
iv. ¿Qu´e consulta habr´ıa que hacer para encontrar a los nietos de juan?

abuelo(Juan, X)		
			
v. ¿C´omo se puede definir una consulta para conocer a todos los hermanos de pablo?

hermano(pablo, X)
			
			
			*/
			
			