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
    R is R1+1.
getNrOcc([_|T], X, R) :- getNrOcc(T, X, R).


/*
	removeDuplicates(L1_L2...LN, OGL) = [] if N = 0 
    									{L1} U removeDuplicates(L2_L3...LN, OGL) if getNrOcc(OGL, L1) = getNrOcc(L, L1)
                                        removeDuplicates(L2_L3...LN, OGL) otherwise
    
    removeDuplicates(L - list of elements, OGL - initial list of elements, R - result list)
    flow model (i, i, o)
*/
removeDuplicates([], _, []) :- !.
removeDuplicates([H|T], OGL, [H|R]) :- 
    getNrOcc(OGL, H, X1),
    getNrOcc([H|T], H, X2),
    X1 =:= X2, !,
    removeDuplicates(T, OGL, R).
removeDuplicates([_|T], OGL, R) :- removeDuplicates(T, OGL, R).


/*
	getMinBiggerThanK(L1_L2...LN, K) = 1000 if N = 0
    								   L1 if L1 > K and L1 < getMinBiggerThanK(L2_L3...LN, K)
                                       getMinBIggerThanK(L2_L3...LN, K) otherwise
    
    getMinBiggerThanK(L - list of elements, K - lower bound, R - result)
    flow model (i, i, o)
*/
getMinBiggerThanK([], _, 1000) :- !.
getMinBiggerThanK([H|T], K, H) :-
    getMinBiggerThanK(T, K, R1), 
    H > K, H < R1, !.
getMinBiggerThanK([_|T], K, R) :- getMinBiggerThanK(T, K, R).

/*
	sortList(L, K) = [] if K = 1000
    				 getMinBiggerThanK(L, K) U sortList(L, getMinBiggerThanK(L, K)) otherwise
    
    sortList(L - list of elements, K - curr min, R - result list)
    flow model (i, i, o)
*/
sortList(_, 1000, []) :- !.
sortList(L, K, [X|R]) :- 
    getMinBiggerThanK(L, K, X),
    sortList(L, X, R).

/*
	main(L) = sortList(L, -1000)
    main(L - list of elements, R - result list)
    flow model (i, o)
*/
main(L, R) :- sortList(L, -1000, R).