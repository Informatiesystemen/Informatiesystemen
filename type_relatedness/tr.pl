% author: Hendrik Werner s4549775

% T1
related(X, X) :- !.

% T3
related(X, Z) :-
	related(Y, Z),
	pf(X, Top),
	pf(Y, Top),
	!.

% T2
related(X, Y) :- related(Y, X), !.
