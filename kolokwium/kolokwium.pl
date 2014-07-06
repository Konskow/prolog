rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).
 
:- dynamic(kobieta/1).
kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).
 
mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).


% czy X jest bratem Y
brat(X,Y) :-
    mezczyzna(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.

% czy X jest siostra Y

siostra(X,Y) :-
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.

% czy X jest dziadkiem Y

dziadek(X,Y) :-
    mezczyzna(X),
    rodzic(X,Z),
    rodzic(Z,Y).

babcia(X,Y) :-
    kobieta(X),
    rodzic(X,Z),
    rodzic(Z,Y).


przodek(X,Y) :-
	rodzic(X,Y).
 
przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

potomek(X,Y):-
    rodzic(Y,X).

% czy X jest potomkiem Z
potomek(X,Z):-
    rodzic(Z,Y),
    potomek(Y,X).

krewny(X,Y):-
    przodek(Z,X),
    przodek(Z,Y).

delta(A,B,C,Wynik):-
    Wynik is B * B - 4 * A * C.

kwadrat(A,B,C,Wynik):-
    delta(A,B,C,Delta),
    wynik(A,B,Delta,Wynik).

wynik(A,B,Delta,Wynik):-
    Delta > 0,
    Wynik is (-B - sqrt(Delta)) / (2*A).

wynik(A,B,Delta,Wynik):-
    Delta > 0,
    Wynik is (-B + sqrt(Delta)) / (2*A).

wynik(A,B,Delta,Wynik):-
    Delta == 0,
    Wynik is (-B) / (2*A).


factorial(0,X):-
    X is 1.

factorial(N,Wynik):-
    N > 0,
    New is N-1,
    factorial(New,M),
    Wynik is N * M.


% on(X,Y) means that block X is directly on top of block Y.
on(b1,b2).   on(b3,b4).   on(b4,b5).   on(b5,b6).

% just left(X,Y) means that blocks X and Y are on the table
% and that X is immediately to the left of Y.
just_left(b2,b6).   just_left(b6,b7).

% above(X,Y) means that block X is somewhere above block Y 
% in the pile where Y occurs.
above(X,Y) :- on(X,Y).
above(X,Y) :- on(X,Z), above(Z,Y).

% left(X,Y) means that block X is somewhere to the left 
% of block Y but perhaps higher or lower than Y.
left(X,Y) :- just_left(X,Y).
left(X,Y) :- just_left(X,Z), left(Z,Y).
left(X,Y) :- on(X,Z), left(Z,Y).     % leftmost is on something.
left(X,Y) :- on(Y,Z), left(X,Z).     % rightmost is on something.

% right(X,Y) is the opposite of left(X,Y).
right(Y,X) :- left(X,Y).

porownaj([_,_,A,A|_]).

zamien([A,B,C,D|T], [A,B,D,C|T]).


nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).


dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.


sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
