% author: Hendrik Werner s4549775

% Examples

% T1
% ?- related(a, a).

% T2
%% related(a, b).
% ?- related(b, a).

% T3
%% pater_familias(z, y).
%% pater_familias(x, y).
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

% T2
type_related(X, Y) :- related(Y, X), !; related(Y, X).

% T1
related(X, X) :- !.

% T3
related(X, Z) :-
	type_related(Y, Z),
	pater_familias(X, Top),
	pater_familias(Y, Top),
	!.

% T4
related(X, Z) :-
	gen(X, Y),
	type_related(Y, Z),
	!.

% T5 & T6
related(X, Y) :-
	element_type(X, T1),
	element_type(Y, T2),
	type_related(T1, T2),
	!.

% default values
element_type(_, _) :- false.
gen(_, _) :- false.
pater_familias(X, X).
