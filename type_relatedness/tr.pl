% author: Hendrik Werner s4549775

% Examples

% T1
% ?- related(a, a).

% T2
%% related(a, b).
% ?- related(b, a).

% T3
%% pf(z, y).
%% pf(x, y).
%% related(z, y).
% ?- related(z, x).

% T4
%% gen(y, x).
%% related(x, z).
% ?- related(y, z).

% T5 & T6
%% element_type(x, z).
%% element_type(y, z).
% ?- related(x, y).

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

% T5 & T6
related(X, Y) :-
	element_type(X, T1),
	element_type(Y, T2),
	related(T1, T2),
	!.

% T2
related(X, Y) :- related(Y, X), !.

% default values
element_type(_, _) :- false.
gen(X, Y) :- false.
pf(X, X).
