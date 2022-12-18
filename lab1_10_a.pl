/*
	isValley(L1_L2...LN, D, PREV) = true if N = 0 & D = 1
    						  		isValley(L2_L3...LN, -1, L1) if D = -1 & L1 < PREV
                                    isValley(L2_L3...LN, 1, L1) if (D = -1 || D == 1) & L1 > PREV
									false otherwise
    
    isValley(L - list of elements, D - direction flag, PREV - previous element)
    flow model (i, i, i)
*/
isValley([], 1, _) :- !.
isValley([H|T], -1, PREV) :-
    H < PREV, !,
    isValley(T, -1, H).
isValley([H|T], _, PREV) :- 
    H > PREV, 
    isValley(T, 1, H).


/*
	main(L1_L2...LN) = isValley(L2_L3...LN, -1, L1) if L1 > L2
    				   false otherwise
   
    main(L - list of elements)
    flow model (i)
*/
main([L1,L2|T]) :- 
    L1 > L2, 
    isValley([L2|T], -1, L1). 