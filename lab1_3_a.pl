/* 
	occ(L1_L2...LN, X) = 0 if N = 0
						 1 + occ(L2_L3...LN, X) if L1 = X
                         occ(L2_L3...LN, X) otherwise

	occ(L - list of elements; X - element to have number of occ counted; R - number of occ. of X)
    flow model (i, i, o)
*/
occ([], _, 0) :- !.
occ([H|T], X, R) :-
    H =:= X, !, 
    occ(T, X, R1),
    R is 1+R1.
occ([H|T], X, R) :-
    H =\= X, !,
    occ(T, X, R).


/*
	removeRepetitive(L1_L2...LN, OL) = [] if N = 0
    								   {L1} U removeRepetitive(L2_L3...LN, OL) if occ(OL, L1) = 1
                                       removeRepetitive(L2_L3...LN, OL) otherwise
                                       
    removeRepetitive(L - list of elements; OL - original list of numbers; R - result list)
    flow model (i, i, o)
*/
removeRepetitive([], _, []) :- !.
removeRepetitive([H|T], OL, [H|R]) :- 
    occ(OL, H, X),
    X =:= 1, !, 
    removeRepetitive(T, OL, R).
removeRepetitive([_|T], OL, R) :-
    removeRepetitive(T, OL, R).


/*
	main(L) = removeRepetitive(L, L)
    
    main(L - list of elements, R - result list)
    flow model (i, o)
*/
main(L, R) :- removeRepetitive(L, L, R).
    