/*
	insert(L1_L2...LN, POS, X) = {X} U L if POS = 1 
    							 [] if N = 0
                                 {L1} U insert(L2_L3...LN, POS - 1, X) otherwise
     
     insert(L - list of elements, POS - integer that represents the position to insert X, 
     		X - element to be inserted, R - result list)
     flow model (i, i, i, o)
*/
insert(L, 1, X, [X|L]) :- !.
insert([], _, _, []) :- !.
insert(L, 0, _, L) :- !.
insert([H|T], POS, X, [H|R]) :- 
    POS1 is POS-1,
    insert(T, POS1, X, R).
   