/*
	addValue(L1_L2...LN, V, X1, X2) = [] if N = 0
    								  {L1} U {V} U addValue(L2_L3...LN, V, X1 * 2, X2 + 1) if X1 = X2
                                      {L1} U addValue(L2_L3...LN, V, X1, X2 + 1) otherwise
    
    addValue(L - list of elements, V - value to add, X1 - position after we want a value added, 
    		 X2 - current position, R - result list)
    flow model (i, i, i, i, o)
*/
addValue([], _, _, _, []) :- !.
addValue([H|T], V, X1, X2, [H,V|R]) :- 
    X1 =:= X2, !,
    X11 is X1*2,
    X21 is X2+1,
    addValue(T, V, X11, X21, R).
addValue([H|T], V, X1, X2, [H|R]) :-
    X21 is X2+1,
    addValue(T, V, X1, X21, R).


/*
	main(L, V) = addValue(L, V, 1, 1)
    main(L - list of integers, V - value to add, R - result list)
    flow model (i, i, o)
*/
main(L, V, R) :- addValue(L, V, 1, 1, R).