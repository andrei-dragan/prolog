/*
	add1(L1_L2...LN) = [] if N = 0
    				   {L1} U {1} U add1(L2_L3...LN) if L1 % 2 = 0
                       {L1} U add1(L2_L3...LN) otherwise
   
    add1(L - list of elements, R - result list)
    flow model (i, o)
*/

add1([], []) :- !.
add1([H|T], [H,1|R]) :-
    H mod 2 =:= 0, !,
    add1(T, R). 
add1([H|T], [H|R]) :-
    add1(T, R).