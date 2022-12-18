/*
 	replace(L11_L12...L1N, E, L21_L22...L2M, OGL2) = [] if N = 0
                                                     replace(L12_L13...L1N, E, OGL2, OGL2) if M = 0
                                                     {L21} U replace(L11_L12...L1N, E, L22_L23...L2M, OGL2) if L11 = E 
													 {L11} U replace(L12_L13...L1N, E, L2, OGL2) otherwise
    
    replace(L1 - list of elements, E - element to be replaced, L2 - replacement list of elements
    		OGL2 - initial replacement list of elements, R - result list)
    flow model (i, i, i, i, o)
*/
replace([], _, _, _, []) :- !.
replace([_|T], E, [], OGL2, R) :- !, replace(T, E, OGL2, OGL2, R).
replace([E|T1], E, [H2|T2], OGL2, [H2|R]) :- !, replace([E|T1], E, T2, OGL2, R).
replace([H|T], E, L2, OGL2, [H|R]) :- replace(T, E, L2, OGL2, R).


/*
	main(L1, E, L2) = replace(L1, E, L2, L2)
    main(L1 - list of elements, E - element to be replaced, L2 - replacement list of elements, R - result list)
    flow model (i, i, i, o)
*/
main(L1, E, L2, R) :- replace(L1, E, L2, L2, R).