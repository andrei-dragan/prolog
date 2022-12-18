/*
	removeAtom(L1_L2...LN, X) = [] if N = 0
    						    removeAtom(L2_L3...LN, X) if L1 = X
                                {L1} U removeArom(L2_L3...LN, X) otherwise
    
    removeAtom(L - list of elements, X - atom to be removed, R - result list)
    flow model (i, i, o)
*/
removeAtom([], _, []) :- !.
removeAtom([X|T], X, R) :- !, removeAtom(T, X, R).
removeAtom([H|T], X, [H|R]) :- removeAtom(T, X, R).