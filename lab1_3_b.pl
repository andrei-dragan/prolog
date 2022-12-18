/*
	isMax(L1_L2...LN, X) = true if N = 0
    					   false if L1 > X
                           isMax(L2_L3...LN, X) otherwise
                           
    isMax(L - list of integers, X - element to be checked if maximum)
    flow model (i, i)
*/
isMax([], _) :- !.
isMax([H|T], X) :- 
    H =< X, 
    isMax(T, X). 


/* 
	getMax(L1_L2...LN) = 0 if N = 0
    					 L1 if isMax(L2_L3...LN, L1) = true
                         getMax(L2_L3...LN) otherwise
                         
    getMax(L - list of integers, R - maximum number from that list)
    flow model (i, o)
*/
getMax([], 0) :- !.
getMax([H|T], R) :- 
    isMax(T, H), !,
    R is H.
getMax([_|T], R) :-
    getMax(T, R).

/*
	removeMax(L1_L2...LN, Max) = [] if N = 0
    						     removeMax(L2_L3...LN, Max) if L1 = Max
                                 {L1} U removeMax(L2_L3...LN, Max) otherwise
    
    removeMax(L - list of integers, Max - maximum element from L, R - result list)
    flow model (i, i, o)
*/
removeMax([], _, []) :- !.
removeMax([Max|T], Max, R) :-
    !, 
    removeMax(T, Max, R).
removeMax([H|T], Max, [H|R]) :-
    removeMax(T, Max, R).

/*
	main(L) = removeMax(L, getMax(L))
    
    main(L - list of integers, R - result list)
    flow model (i, o)
*/
main(L, R) :- 
    getMax(L, X),
    removeMax(L, X, R).




