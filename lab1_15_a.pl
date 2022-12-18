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
	makeSet(L1_L2...LN, OGL) = [] if N = 0
    						   {l1} U makeSet(L2_L3...LN, OGL) if getNrOcc(OGL, L1) = getNrOcc(L, L1)
                               makeSet(L2_L3...LN, OGL) otherwise
    
    makeSet(L - list of elements, OGL - original list of elements, R - result list)
    flow model (i, i, o)
*/
makeSet([], _, []) :- !.
makeSet([H|T], OGL, [H|R]) :- 
    getNrOcc(OGL, H, X1),
    getNrOcc([H|T], H, X2),
    X1 =:= X2, !,
    makeSet(T, OGL, R).
makeSet([_|T], OGL, R) :- makeSet(T, OGL, R).


/*
	main(L) = makeSet(L, L)
    main(L - list of elements, R - result list)
    flow model (i, o)
*/
main(L, R) :- makeSet(L, L, R).