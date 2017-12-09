% author: Hendrik Werner s4549775

% T1
related(X, X) :- !.

% T2
related(X, Y) :- related(Y, X), !.
