/*
	generateListWithUpperBound(N, X) = [] if X > N
    					 			   {X} U generateListWithUpperBound(N, X + 1) otherwise
                           
    generateListWithUpperBound(N - integer number, X - current integer, R - result list)
    flow model (i, i, o)
*/ 
generateListWithUpperBound(N, X, []) :- 
    X > N, !.
generateListWithUpperBound(N, X, [X|R]) :-
    X1 is X+1,
    generateListWithUpperBound(N, X1, R).

/*
	generateInterval(M, N) = generateListWithUpperBound(N, M)
    
    generateInterval(M - integer number / lower bound, N - integer number / upper bound, R - result list)
    flow model (i, i, o)
*/
generateInterval(M, N, R) :- generateListWithUpperBound(N, M, R).