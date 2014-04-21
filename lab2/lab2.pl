/*
 * family.pl
 * taken from Bratko, 3rd ed, ch.1, p.17
 *
 */

:- dynamic(kobieta/1).

rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

potomek(X,Y) :-
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

%%
madziecko(X) :-
	rodzic(X,_).

				% 2 razy robert? unique?

%% ex 1.3
szczesciarz(X) :-
	madziecko(X).

dwojedzieci(X) :-
	rodzic(X,Y),
	siostra(_,Y).

%% ex 1.4
wnuk(X,Z) :-
	rodzic(Y,X),
	rodzic(Z,Y).

%% ex 1.5
ciocia(X,Y) :-
	rodzic(Z,Y),
	siostra(X,Z).



%%%%
% Pytanie czemu nic sie nie pojawia gdy: kobieta(K),fail.
% PK: odp bo nie ma write(K).


:- dynamic(capital_of/2).      % Remove if not needed. See text, section 2.8.

capital_of(georgia,atlanta).
capital_of(california,sacramento).
capital_of(florida,tallahassee).
capital_of(maine,augusta).

