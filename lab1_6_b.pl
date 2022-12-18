/*
	remove3occ(L1_L2...LN, X, C) = [] if N = 0
								   L if C = 0
                                   remove3occ(L2_L3...LN, X, C - 1) if L1 = X
                                   {L1} U remove3occ(L2_L3...LN, X, C) otherwise
                                   
    remove3occ(L - list of elements, X - element to be checked, C - number of removals, R - result list)
    flow model (i, i, i, o)
*/
remove3occ([], _, _, []) :- !.
remove3occ(L, _, 0, L) :- !.
remove3occ([X|T], X, C, R) :-
    !, 
    C1 is C-1,
    remove3occ(T, X, C1, R).
remove3occ([H|T], X, C, [H|R]) :-
    remove3occ(T, X, C, R).

/*
	main(L, X) = remove3occ(L, X, 3)
    
    main(L - list of elements, X - element to be checked, R - result list)
    flow model (i, i, o)
*/
main(L, X, R) :- remove3occ(L, X, 3, R).