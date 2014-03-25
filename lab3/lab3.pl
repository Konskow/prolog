trzeci([A,B,C|Reszta],C).

porownaj([A,B,C,C|Reszta]).

zamien([A,B,C,D|Reszta], [A,B,D,C|Reszta]).

nalezy(X,[X|_]).

nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

ostatni(Element, [Element]).
ostatni(Element, [X|Ogon]):-
    ostatni(Element,Ogon).



ostatni2(Element, Lista):-
    sklej(_,[Element|[]],Lista).

dodaj(X,L,[X|L]).



usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).


wstaw(X,L,Duza) :-
	usun(X,Duza,L).

zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).


permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).
 
permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).

odwroc([],[]).
odwroc([H|T],L) :-
    odwroc(T,R),
    sklej(R,[H],L).

wypisz([H|T]) :-
	write(H), wypisz(T).
wypisz([]).


odwroc2(L,R) :-
     odwr2(L,[],R).
odwr2([H|T],A,R) :-
     odwr2(T,[H|A],R).
odwr2([],A,A).


