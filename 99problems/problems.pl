sklej([],L2,L2).
sklej([H|T], L2, [H|Acc]):-
	sklej(T, L2, Acc).

% 1

last(X, [X]).
last(X, [_|Tail]):-
	last(X,Tail).

%2

last_but_one(X, [X,_]).
last_but_one(X, [_|Tail]):-
	last_but_one(X,Tail).

%3

element_at(X, [X|_], 1).
element_at(X, [_|Tail],N):-
	DecN is N - 1,
	element_at(X,Tail,DecN).


%4

length2(0, []).
length2(N, [_|Tail]):-
	length2(M,Tail),
	N is M + 1.

%5

