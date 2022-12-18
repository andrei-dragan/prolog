/*
	isInside(L1_L2...LN, X) = false if N = 0
    						  true if L1 = X
                              isInside(L2_L3...LN) otherwise
    
    isInside(L - list of elements, X - element to be found)
    flow model (i, i)
*/
isInside([H|_], H) :- !.
isInside([_|T], X) :- isInside(T, X).


/*
	union(L11_L12...L1N, L2) = L2 if N = 0
    						   {L11} U union(L12_L13...L1N, L2) if isInside(L2, L11) = false
                               union(L12_L13...L1N, L2) otherwise 
    
    union(L1 - first set, L2 - second set, R - result union set)
    flow model (i, i, o)
*/
union([], L2, L2) :- !.
union([H|T], L2, [H|R]) :- 
    \+ isInside(L2, H), !, 
    union(T, L2, R).
union([_|T], L2, R) :-
    union(T, L2, R).