/*
	isUnique(L1_L2...LN, X) = true if N = 0
    						  false if L1 = X
                              isUnique(L2_L3...LN, X) otherwise
    
    isUnique(L - list, X - element to be checked)
    flow model (i, i)
*/
isUnique([], _) :- !.
isUnique([H|T], X) :-
    H =\= X,
    isUnique(T, X).


/*
	isSet(L1_L2...LN) = true if N = 0
    					false is isUnique(L2_L3...LN, L1) = false
                        isSet(L2_L3...LN) otherwise
    
    isSet(L - list)
    flow model (i)
*/
isSet([]) :- !.
isSet([H|T]) :-
    isUnique(T, H),
    isSet(T).