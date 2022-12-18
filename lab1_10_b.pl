/*
	getSum(L1_L2...LN, SIGN) = 0 if N = 0
								L1 * SIGN + getSum(L2_L3...LN, SIGN * (-1)) otherwise
    getSum(L - list of elements, SIGN - sign of element, R - result sum)
    flow model (i, i, o) 
*/
getSum([], _, 0) :- !.
getSum([H|T], SIGN, R) :- 
    SIGN1 is SIGN*(-1), 
    getSum(T, SIGN1, R1),
    R is R1+SIGN*H.

/*
	main(L) = getSum(L, 1)
    main(L - list of elements, R - result sum) 
    flow model(i, o)
*/
main(L, R) :- getSum(L, 1, R).
    