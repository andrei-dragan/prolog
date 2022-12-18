/*
	getNrOcc(L1_L2...LN, X) = 0 if N = 0
    						  1 + getNrOcc(L2_L3...LN, X) if L1 = X
                              getNrOcc(L2_L3...LN, X) otherwise
    
    getNrOcc(L - list of elements, X - atom to be counted, R - number of occ)
    flow model (i, i, o)
*/
getNrOcc([], _, 0) :- !.
getNrOcc([X|T], X, R) :- 
    !, 
    getNrOcc(T, X, R1),
    R is R1+1.
getNrOcc([_|T], X, R) :- getNrOcc(T, X, R).


/*
	numberAtom(L1_L2...LN, OGL) = [] if N = 0
    							  [L1, getNrOcc(OGL, L1)] U numberAtom(L2_L3...LN, OGL) if getNrOcc(OGL, L1) = getNrOcc(L, L1)
								  numberAtom(L2_L3...LN, OGL) otherwise
	
    numberAtom(L - list of elements, OGL - original list of elements, R - result list)
    flow model (i, i, o)
*/
numberAtom([], _, []) :- !.
numberAtom([H|T], OGL, [[H, X]|R]) :-
    getNrOcc(OGL, H, X),
    getNrOcc([H|T], H, X1),
    X =:= X1, !,
    numberAtom(T, OGL, R).
numberAtom([_|T], OGL, R) :- numberAtom(T, OGL, R).

/*
	main(L) = numberAtom(L, L)
    main(L - list of elements, R - result list)
    flow model (i, o)
*/
main(L, R) :- numberAtom(L, L, R).