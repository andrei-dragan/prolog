/*
	isMultuple(L1_L2...LN, X) = true if N = 0
    							false if X % L1 != 0
								isMultiple(L2_L3...LN, X) otherwise
    isMultiple(L - list of integers, X - candidate LCM)
    flow model (i, i)
*/
isMultiple([], _) :- !.
isMultiple([H|T], X) :- 
    X mod H =:= 0, !,
    isMultiple(T, X).

/*
	getLCM(L, X) = X if isMultiple(L, X) = true
    			   getLCM(L, X + 1) otherwise
    getLCM(L - list of integers, X - candidate LCM, R - result LCM)
    flow model (i, i, o)
*/
getLCM(L, X, X) :- isMultiple(L, X), !.
getLCM(L, X, R) :- 
    X1 is X+1,
    getLCM(L, X1, R).

/*
	main(L) = getLCM(L, 1)
    main(L - list of integers, R - result LCM)
    flow model (i, o)
*/
main(L, R) :- getLCM(L, 1, R).
    