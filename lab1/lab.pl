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

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

% Y bratem X
brat(X,Y) :-
    mezczyzna(Y),
    rodzic(Z,Y),
    rodzic(Z,X),
    X \= Y.

% Y siostra X
siostra(X,Y) :-
    kobieta(Y),
    rodzic(Z,Y),
    rodzic(Z,X),
    X \= Y.

% X dziadkiem Y
dziadek(X,Y):-
    ojciec(X,Z),
    rodzic(Z,Y).

babcia(X,Y):-
    matka(X,Z),
    rodzic(Z,Y).

%X przodkiem Z
przodek(X,Y) :-
	rodzic(X,Y).
 
przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

% X potomkiem Z
potomek(X,Z) :-
    przodek(Z,X).

% X krewnym Z
krewny(X,Z) :-
    przodek(Y,X),
    przodek(Y,Z),
    X \= Z.
