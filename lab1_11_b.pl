/*
	buildSublist(L1_L2...LK, M, N, I) = [] if I > N
    									{L1} U buildSublist(L2_L3...LK, M, N, I + 1) if I >= M
                                        buildSublist(L2_L3...LK, M, N, I + 1) otherwise
   
    buildSublist(L - list of elements, M - starting index of sublist, N - ending index of sublist, I - current index
    			 R - result list) 
    flow model (i, i, i, i, o)
*/
buildSublist(_, _, N, I, []) :- I > N, !.
buildSublist([H|T], M, N, I, [H|R]) :- 
    I >= M, !, 
    I1 is I+1,
    buildSublist(T, M, N, I1, R).
buildSublist([_|T], M, N, I, R) :- 
    I1 is I+1,
    buildSublist(T, M, N, I1, R).

/*
	main(L, M, N) = buildSublist(L, M, N, 1)
    main(L - list of elements, M -starting index of sublist, N - ending index of sublist, R - result list)
    flow model (i, i, i, o)
*/
main(L, M, N, R) :- buildSublist(L, M, N, 1, R).
             