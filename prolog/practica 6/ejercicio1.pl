padre(juan, carlos).
padre(juan, luis).
/**padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
padre(ramiro, fabian).*/
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y), X\=Y.
descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(Z,Y), descendiente(X,Z).

ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).


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

[trace]  ?- ancestro(juan, X).
   Call: (8) ancestro(juan, _2716) ? creep
   Exit: (8) ancestro(juan, juan) ? creep
X = juan ;
   Redo: (8) ancestro(juan, _2716) ? creep
   Call: (9) padre(juan, _2934) ? creep
   Exit: (9) padre(juan, carlos) ? creep
   Call: (9) ancestro(carlos, _2716) ? creep
   Exit: (9) ancestro(carlos, carlos) ? creep
   Exit: (8) ancestro(juan, carlos) ? creep
X = carlos ;
   Redo: (9) ancestro(carlos, _2716) ? creep
   Call: (10) padre(carlos, _2934) ? creep
   Exit: (10) padre(carlos, daniel) ? creep
   Call: (10) ancestro(daniel, _2716) ? creep
   Exit: (10) ancestro(daniel, daniel) ? creep
   Exit: (9) ancestro(carlos, daniel) ? creep
   Exit: (8) ancestro(juan, daniel) ? creep
X = daniel ;
   Redo: (10) ancestro(daniel, _2716) ? creep
   Call: (11) padre(daniel, _2934) ? creep
   Fail: (11) padre(daniel, _2934) ? creep
   Fail: (10) ancestro(daniel, _2716) ? creep
   Redo: (10) padre(carlos, _2934) ? creep
   Exit: (10) padre(carlos, diego) ? creep
   Call: (10) ancestro(diego, _2716) ? creep
   Exit: (10) ancestro(diego, diego) ? creep
   Exit: (9) ancestro(carlos, diego) ? creep
   Exit: (8) ancestro(juan, diego) ? creep
X = diego ;
   Redo: (10) ancestro(diego, _2716) ? creep
   Call: (11) padre(diego, _2934) ? creep
   Fail: (11) padre(diego, _2934) ? creep
   Fail: (10) ancestro(diego, _2716) ? creep
   Fail: (9) ancestro(carlos, _2716) ? creep
   Redo: (9) padre(juan, _2934) ? creep
   Exit: (9) padre(juan, luis) ? creep ---VOY POR ACA
   Call: (9) ancestro(luis, _2716) ? creep
   Exit: (9) ancestro(luis, luis) ? creep
   Exit: (8) ancestro(juan, luis) ? creep
X = luis ;
   Redo: (9) ancestro(luis, _2716) ? creep
   Call: (10) padre(luis, _2934) ? creep
   Exit: (10) padre(luis, pablo) ? creep
   Call: (10) ancestro(pablo, _2716) ? creep
   Exit: (10) ancestro(pablo, pablo) ? creep
   Exit: (9) ancestro(luis, pablo) ? creep
   Exit: (8) ancestro(juan, pablo) ? creep
X = pablo ;
   Redo: (10) ancestro(pablo, _2716) ? creep
   Call: (11) padre(pablo, _2934) ? creep
   Fail: (11) padre(pablo, _2934) ? creep
   Fail: (10) ancestro(pablo, _2716) ? creep
   Redo: (10) padre(luis, _2934) ? creep
   Exit: (10) padre(luis, manuel) ? creep
   Call: (10) ancestro(manuel, _2716) ? creep
   Exit: (10) ancestro(manuel, manuel) ? creep
   Exit: (9) ancestro(luis, manuel) ? creep
   Exit: (8) ancestro(juan, manuel) ? creep
X = manuel ;
   Redo: (10) ancestro(manuel, _2716) ? creep
   Call: (11) padre(manuel, _2934) ? creep
   Fail: (11) padre(manuel, _2934) ? creep
   Fail: (10) ancestro(manuel, _2716) ? creep
   Redo: (10) padre(luis, _2934) ? creep
   Exit: (10) padre(luis, ramiro) ? creep
   Call: (10) ancestro(ramiro, _2716) ? creep
   Exit: (10) ancestro(ramiro, ramiro) ? creep
   Exit: (9) ancestro(luis, ramiro) ? creep
   Exit: (8) ancestro(juan, ramiro) ? creep
X = ramiro ;
   Redo: (10) ancestro(ramiro, _2716) ? creep
   Call: (11) padre(ramiro, _2934) ? creep
   Exit: (11) padre(ramiro, fabian) ? creep
   Call: (11) ancestro(fabian, _2716) ? creep
   Exit: (11) ancestro(fabian, fabian) ? creep
   Exit: (10) ancestro(ramiro, fabian) ? creep
   Exit: (9) ancestro(luis, fabian) ? creep
   Exit: (8) ancestro(juan, fabian) ? creep
X = fabian ;
   Redo: (11) ancestro(fabian, _2716) ? creep
   Call: (12) padre(fabian, _2934) ? creep
   Fail: (12) padre(fabian, _2934) ? creep
   Fail: (11) ancestro(fabian, _2716) ? creep
   Fail: (10) ancestro(ramiro, _2716) ? creep
   Fail: (9) ancestro(luis, _2716) ? creep
   Fail: (8) ancestro(juan, _2716) ? creep
false.

			
			
			*/
			
			