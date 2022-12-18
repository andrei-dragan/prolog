/*
	removeKth(L1_L2...LN, K) = L if K = 0
							   removeKth(L2_L3...LN, K - 1) if K = 1
							   {L1} U removeKth(L2_L3...LN, K - 1) otherwise
	removeKth(L - list of elements, K - index of the element to be removed, R - result list)
    flow model(i, i, o)
*/
removeKth(L, 0, L) :- !.
removeKth([_|T], 1, R) :- !, removeKth(T, 0, R).
removeKth([H|T], K, [H|R]) :-
    K1 is K-1,
    removeKth(T, K1, R).