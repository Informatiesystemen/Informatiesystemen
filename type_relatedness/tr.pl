% author: Hendrik Werner s4549775

% T1
related(X, X) :- !.

% T3
related(X, Z) :-
	related(Y, Z),
	pf(X, Top),
	pf(Y, Top),
	!.

% T4
related(X, Z) :-
	gen(X, Y),
	related(Y, Z),
	!.

% T2
related(X, Y) :- related(Y, X), !.

% default values
gen(X, Y) :- false.
