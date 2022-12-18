/*
	getNrElements(L1_L2...LN) = 0 if N = 0
    							1 + getNrElements(L2_L3...LN) otherwise
    
    getNrElements(L - list of elements, R - number of elements)
    flow model (i, o)
*/
getNrElements([], 0) :- !.
getNrElements([_|T], R) :-
    getNrElements(T, R1),
    R is 1+R1.


/*
	getNrOcc(L1_L2...LN, X) = 0 if N = 0
    						  1 + getNrOcc(L2_L3...LN, X) if L1 = X
                              getNrOcc(L2_L3...LN, X) otherwise
    
    getNrOcc(L - list of elements, X - element to be counted, R - number of occ of X)
    flow model (i, i, o)
*/
getNrOcc([], _, 0) :- !.
getNrOcc([X|T], X, R) :-
    !, 
    getNrOcc(T, X, R1),
    R is 1+R1.
getNrOcc([_|T], X, R) :- getNrOcc(T, X, R).


/*
	setByOcc(L1_L2...LN, OGL, K, MK) = [] if K > MK
									   setByOcc(OGL, OGL, K + 1, MK) if N = 0
                                       {L1} U setByOcc(L2_L3...LN, OGL, K, MK) if getNrOcc(L, L1) = K & getNrOcc(OGL, L1) = K
                                       setByOcc(L2_L3...LN, OGL, K, MK) otherwise
	setByOcc(L - list of elements, OGL - original list of elements, K - current number of occ we are looking for,
     		 MK - max number of occ, R - result set list)
    flow model (i, i, i, i, o)
*/
setByOcc(_, _, K, MK, []) :- K > MK, !.
setByOcc([], OGL, K, MK, R) :-
    !,
    K1 is K+1,
    setByOcc(OGL, OGL, K1, MK, R).
setByOcc([H|T], OGL, K, MK, [H|R]) :- 
    getNrOcc([H|T], H, X1),
    X1 =:= K,
    getNrOcc(OGL, H, X2),
    X2 =:= K,
    !,
    setByOcc(T, OGL, K, MK, R).
setByOcc([_|T], OGL, K, MK, R) :-
    setByOcc(T, OGL, K, MK, R).


/*
	main(L) = setByOcc(L, L, 1, getNrElements(L))
    main(L - list of elements, R - result set list)
    flow model (i, o)
*/
main(L, R) :- 
    getNrElements(L, X),
    setByOcc(L, L, 1, X, R).