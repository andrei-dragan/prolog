/*
	selectKth(L1_L2...LN, K) = 0 if N = 0
    						   L1 if K = 1
                               selectKth(L2_L3...LN, K - 1) otherwise
                               
    selectKth(L - list of elements, K - index of element to be selected, R - result element)
    flow model (i, i, o)
*/
selectKth([], _, 0) :- !.
selectKth([H|_], 1, H) :- !.
selectKth([_|T], K, R) :-
    K1 is K-1,
    selectKth(T, K1, R).