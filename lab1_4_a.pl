/*
	isInList(L1_L2...LN, X) = false is N = 0
    						  true if L1 = X 
                              isInList(L2_L3...LN) otherwise
    
    isInList(L - list of elements, X - element to be checked)
    flow model (i, i)
*/
isInList([H|_], H) :- !.
isInList([_|T], X) :- isInList(T, X).

/*
	dif(L11_L12...L1N, L2) = [] if N = 0
    						 dif(L12_L13...L1N, L2) if isInList(L2, L11)
                             {L11} U dif(L12_L13...L1N, L2) otherwise
    
    dif(L1 - list of elements, L2 - list of elements, R - result list)
    flow model (i, i, o)
*/
dif([], _, []) :- !.
dif([H|T], L2, R) :-
    isInList(L2, H), !,
    dif(T, L2, R).
dif([H|T], L2, [H|R]) :-
    dif(T, L2, R).