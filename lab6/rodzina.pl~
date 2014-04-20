/*
 * rodzina1.pl
 * GJN 2005,6
 * based on Bratko, 3rd ed, ch.1, p.17
 *
 */

rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,ania).
rodzic(robert,gosia).
rodzic(robert,basia).
rodzic(basia,janek).

kobieta(kasia).
kobieta(ania).
kobieta(basia).
kobieta(gosia).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(janek).

dziecko(X,Y) :-
	rodzic(Y,X).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

dziadkowie(X,Y) :-
	rodzic(X,Z),
	rodzic(Z,Y).

dziadek(X,Y) :-
	dziadkowie(X,Y),
	mezczyzna(X).

babcia(X,Y) :-
	dziadkowie(X,Y),
	kobieta(X).

siostra(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X),
	X \= Y.

brat(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	mezczyzna(X),
	X \= Y.

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

potomek(X,Y) :-
	rodzic(Y,X).

potomek(Z,X) :-
	rodzic(Y,Z),
	potomek(Y,X).

%%
ma_dziecko(X) :-
	rodzic(X,_).

%% ex 1.3
szczesliwy(X) :-
	ma_dziecko(X).

ma_dwoje_dzieci(X) :-
	rodzic(X,Y),
	siostra(_,Y).

ma_dwoje_dzieci(X) :-
	rodzic(X,Y),
	brat(_,Y).

%% ex 1.4
wnuk(X,Z) :-
	rodzic(Y,X),
	rodzic(Z,Y).

%% ex 1.5
ciocia(X,Y) :-
	rodzic(Z,Y),
	siostra(X,Z).
