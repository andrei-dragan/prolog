/*
    hasEvenNrElements(L1_L2...LN) = true if N = 0
    								!hasEvenNrElements(L2_L3...LN) otherwise
                                    
	hasEvenNrElements(L - list of elements) 
    flow model (i)
*/

hasEvenNrElements([]) :- !.
hasEvenNrElements([_|T]) :- \+ hasEvenNrElements(T).