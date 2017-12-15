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
%% related(y, z).
% ?- related(z, x).

% T4
%% gen(y, x).
%% related(x, z).
% ?- related(y, z).

% T5
%% group_type(x).
%% group_type(y).
%% element_type(x, z).
%% element_type(y, z).
% ?- related(x, y).

% T6
%% seqence_type(x).
%% seqence_type(y).
%% element_type(x, z).
%% element_type(y, z).
% ?- related(x, y).

% Figure 2.26
%% element_type(b, a).
%% element_type(e, d).
%% element_type(f, e).
%% gen(a, c).
%% gen(a, b).
%% pater_familias(d, a).

related_types(X, RelatedTypes) :-
	findall(Y, related(X, Y), RT),
	sort(RT, RelatedTypes). % sort/2 also removes duplicates

% T1
related(X, X).

% T2
related(X, Y) :-
	atom(X), atom(Y),
	atom_string(X, XS),
	atom_string(Y, YS),
	XS > YS,
	related(Y, X).

% T3
related(X, Z) :-
	pater_familias(X, Top),
	pater_familias(Y, Top),
	X \= Y,
	related(Y, Z).

% T4
related(X, Z) :-
	gen(X, Y),
	related(Y, Z).

% T5
related(X, Y) :-
	group_type(X),
	group_type(Y),
	element_type(X, T1),
	element_type(Y, T2),
	related(T1, T2).

% T6
related(X, Y) :-
	seqence_type(X),
	seqence_type(Y),
	element_type(X, T1),
	element_type(Y, T2),
	related(T1, T2).

% default values
element_type(_, _) :- false.
gen(_, _) :- false.
group_type(_) :- false.
pater_familias(X, X).
seqence_type(_) :- false.
