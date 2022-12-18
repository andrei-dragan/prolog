/*
	isMini(L1_L2...LN, X) = true if N = 0
    						false if L1 < X
                            isMini(L2_L3...LN, X) otherwise
    
    isMini(L - list of elements, X - minimum number to be checked)
    flow model (i, i)
*/
isMini([], _) :- !.
isMini([H|T], X) :- 
    H >= X,
    isMini(T, X).


/*
	getMin(L1_L2...LN) = 0 if N = 0
    					 L1 if isMini(L2_L3...LN, L1) = true
                         getMin(L2_L3...LN) otherwise
   
    getMin(L - list of elements, X - min element)
    flow model (i, o)
*/
getMin([], 0) :- !.
getMin([H|T], H) :- isMini(T, H), !.
getMin([_|T], X) :- getMin(T, X).


/*
	removeFirstOcc(L1_L2...LN, X) = [] if N = 0
    							    L2_L3...LN if L1 = X
                                    {L1} U removeFirstOcc(L2_L3...LN, X) otherwise
    
    removeFirstOcc(L - list of elements, X - element to be deleted, R - result list)
    flow model (i, i, o)
*/
removeFirstOcc([], _, []) :- !.
removeFirstOcc([H|T], H, T) :- !.
removeFirstOcc([H|T], X, [H|R]) :- removeFirstOcc(T, X, R).


/*
	removeFirstMin(L) = removeFirstOcc(L, getMin(L))
    removeFirstMin(L - list of elements, R - result list)
    flow model (i, o)
*/
removeFirstMin(L, R) :- 
    getMin(L, X),
    removeFirstOcc(L, X, R).

