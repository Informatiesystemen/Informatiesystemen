% author: Hendrik Werner s4549775

% Examples

% T1
% ?- type_related(a, a).

% T2
%% related(a, b).
% ?- type_related(b, a).

% T3
%% pater_familias(z, y).
%% pater_familias(x, y).
%% related(z, y).
% ?- type_related(z, x).

% T4
%% gen(y, x).
%% related(x, z).
% ?- type_related(y, z).

% T5
%% group_type(x).
%% group_type(y).
%% element_type(x, z).
%% element_type(y, z).
% ?- type_related(x, y).

% T6
%% seqence_type(x).
%% seqence_type(y).
%% element_type(x, z).
%% element_type(y, z).
% ?- type_related(x, y).

% Figure 2.26
%% element_type(b, a).
%% element_type(e, d).
%% gen(a, c).
%% gen(a, b).

related_types(X, RelatedTypes) :-
	findall(Y, type_related(X, Y), RT),
	sort(RT, RelatedTypes). % sort/2 also removes duplicates

% T2
type_related(X, Y) :- related(X, Y); related(Y, X).

% T1
related(X, X).

% T3
related(X, Z) :-
	pater_familias(X, Top),
	pater_familias(Y, Top),
	X \= Y,
	type_related(Y, Z).

% T4
related(X, Z) :-
	gen(X, Y),
	type_related(Y, Z).

% T5
related(X, Y) :-
	group_type(X),
	group_type(Y),
	element_type(X, T1),
	element_type(Y, T2),
	type_related(T1, T2).

% T6
related(X, Y) :-
	seqence_type(X),
	seqence_type(Y),
	element_type(X, T1),
	element_type(Y, T2),
	type_related(T1, T2).

% default values
element_type(_, _) :- false.
gen(_, _) :- false.
group_type(_) :- false.
pater_familias(X, X).
seqence_type(_) :- false.
