/*
	isMax(L1_L2...LN, X) = true if N = 0
    					   false is L1 > X
                           isMax(L2_L3...LN, X) otherwise
    
    isMax(L - list of elements, X - candidate max element)
    flow model (i, i)
*/
isMax([], _) :- !.
isMax([H|T], X) :- 
    H =< X,
    isMax(T, X).


/*
	getMax(L1_L2...LN) = 0 if N = 0
    					 L1 if isMax(L2_L3...LN, L1)
                         getMax(L2_L3...LN) otherwise
    
    getMax(L - list of elements, R - max number)
    flow model (i, o)
*/
getMax([], 0) :- !.
getMax([H|T], H) :- isMax(T, H), !.
getMax([_|T], X) :- getMax(T, X).


/*
	isDiv(L1_L2...LN, X) = true if N = 0
    					   false is L1 % X != 0 
                           isDiv(L2_L3...LN, X) otherwise
   
     isDiv(L - list of elements, X - candidate GCD)
     flow model (i, i)
*/
isDiv([], _) :- !.
isDiv([H|T], X) :- 
    H mod X =:= 0,
    isDiv(T, X).

/*
 	gcd(L, X) = X if isDiv(L, X)  
 				gcd(L, X - 1) otherwise
    
    gcd(L - list of elements, X - candidate gcd, R - result gcd)
    flow model (i, i, o)
*/
gcd(L, X, X) :- isDiv(L, X), !.
gcd(L, X, R) :- 
    X1 is X-1,
    gcd(L, X1, R).


/*
	main(L) = gcd(L, getMax(L))
    main(L - list of elements, R - result gcd)
    flow model (i, o)
*/
main(L, R) :- 
    getMax(L, X),
    gcd(L, X, R).
    










