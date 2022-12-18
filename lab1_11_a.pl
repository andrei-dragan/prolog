/*
	getOtherElem(L1_L2...LN, X) = 0 if N = 0
    						      L1 if L1 != X
                                  getOtherElem(L2_L3...LN, X) otherwise
    
    getOtherElem(L - list of elements, X - reference element, R - result element)
    flow model (i, i, o) 
*/
getOtherElem([], _, 0) :- !.
getOtherElem([H|_], X, H) :- H =\= X, !.
getOtherElem([_|T], X, R) :- getOtherElem(T, X, R). 


/*
	replace(L1_L2...LN, X1, X2) = [] if N = 0
    							  {X2} U replace(L2_L3...LN, X1, X2) if L1 = X1
                                  {L1} U replace(L2_L3...LN, X1, X2) otherwise
    
    replace(L - list of elements, X1 - element to be replaced, X2 - replacement element, R - result list)
    flow model (i, i, i, o)
*/
replace([], _, _, []) :- !.
replace([X1|T], X1, X2, [X2|R]) :- !, replace(T, X1, X2, R).
replace([H|T], X1, X2, [H|R]) :- replace(T, X1, X2, R).


/*
	main(L1_L2...LN) = replace(L1_L2...LN, L1, getOtherElem(L, L1))
    main(L - list of element, R - result list)
    flow model (i, o)
*/
main([H|T], R) :-
    getOtherElem([H|T], H, X),
    replace([H|T], H, X, R).