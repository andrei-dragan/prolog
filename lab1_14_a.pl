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
	getNrElements(L1_L2...LN) = 0 if N = 0
    							1 + getNrElements(L2_L3...LN) otherwise
    
    getNrElements(L - list of elements, R - number of elements)
    flow model (i, o)
*/
getNrElements([], 0) :- !.
getNrElements([_|T], R) :-
    getNrElements(T, R1),
    R is 1+R1.


/*
	isEqual(L11_L12...L1N, L2) = true if N = 0
    							 isEqual(L12_L13...L1N, L2) if isInside(L2, L11)
    							 false otherwise
    
    isEqual(L1 - first set list, L2 - second set list)
    flow model (i, i)
*/
isEqual([], _) :- !.
isEqual([H|T], L2) :- isInside(L2, H), !, isEqual(T, L2).


/*
	main(L1, L2) = isEqual(L1, L2) if getNrElements(L1) = getNrElements(L2)
    			   false otherwise
                   
    isEqual(L1 - first set list, L2 - second set list)
    flow model (i, i) 
*/
main(L1, L2) :- 
    getNrElements(L1, X1),
    getNrElements(L2, X2),
    X1 =:= X2,
    isEqual(L1, L2).