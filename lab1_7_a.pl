/*
	isInside(L1_L2...LN, X) = false if N = 0
    						  true if L1 = X
                              isInside(L2_L3...LN, X) otherwise
   
    isInside(L - list of elements, X - element to be checked)
 	flow model (i, i)
*/
isInside([X|_], X) :- !.
isInside([_|T], X) :- isInside(T, X).

/*
	intersect(L11_L12...L1N, L2) = [] if N = 0
    							   {L11} U intersect(L12_L13...L1N, L2) if isInside(L2, L11) = true
                                   intersect(L12_L13...L1N, L2) otherwise
    
    intersect(L1 - list of elements, L2 - list of elements, R - result list)
    flow model (i, i, o)
*/
intersect([], _, []) :- !.
intersect([H|T], L2, [H|R]) :-
    isInside(L2, H), !, 
    intersect(T, L2, R).
intersect([_|T], L2, R) :- intersect(T, L2, R). 