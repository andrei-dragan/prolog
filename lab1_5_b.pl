/*
	addLists(L11_L12...L1N, L2) = L2 if N = 0
    							  {L11} U addList(L12_L13...L1N, L2) otherwise
    
    addLists(L1 - list of elements, L2 - list of elements, R - result list)
    flow model (i, i, o)
*/
addLists([], L2, L2) :- !.
addLists([H|T], L2, [H|R]) :-
    addLists(T, L2, R).


/*
	buildPairs(L1_L2...LN, X) = [] if N = 0
    							[X; L1] U buildPairs(L2_L3...LN, X) otherwise
    
    buildPairs(L - list of elements, X - element to be paired, R - result list)
    flow model (i, i, o)
*/
buildPairs([], _, []) :- !.
buildPairs([H|T], X, [[X, H]|R]) :- buildPairs(T, X, R).


/*
	allPairs(L1_L2...LN) = [] if N = 0 or N = 1
    					   buildPairs(L2_L3...LN, L1) U allPairs(L2_L3...LN) otherwise
    
    allPairs(L - list of elements, R - result list)
	flow model (i, o)
*/
allPairs([], []) :- !.
allPairs([_], []) :- !.
allPairs([H|T], R) :-
    buildPairs(T, H, R1),
    allPairs(T, R2),
	addLists(R1, R2, R).