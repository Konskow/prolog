znaczy(0,zero).   
znaczy(1,jeden).
znaczy(2,dwa).  
znaczy(3,trzy).
znaczy(4,cztery).
znaczy(5,piec).
znaczy(6,szesc).
znaczy(7,siedem).
znaczy(8,osiem).
znaczy(9,dziewiec).


sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
    sklej(L1,L2,L3).


usun3ost(L,L1):-
  sklej(L1,[_,_,_],L).

usun3pie(L,L1):-
 sklej([_,_,_],L1,L).

usun3oba(L,L2):-
    usun3ost(L,L1),
    usun3pie(L1,L2).

nieparzysta([_]).
nieparzysta([_,_|R]):-
    nieparzysta(R).

parzysta([]).
parzysta([_,_|R]):-
    parzysta(R).

odwroc(L,R) :-
     odwr(L,[],R).
odwr([H|T],A,R) :-
     odwr(T,[H|A],R).
odwr([],A,A).

palindrom(L):-
    odwroc(L,X),
    L = X.

przesun([H|Tail],X):-
    sklej(Tail,[H],X).

przeloz([],[]).
przeloz([H|Tail], [X|Rest]):-
    znaczy(H,X),
    przeloz(Tail,Rest).


nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

podzbior(L,[]).
podzbior(L, [HL|TL]):-
    nalezy(HL,L),
    podzbior(L,TL).


podziel([],[],[]).
podziel([X],[X],[]).
podziel([X],[],[X]).
podziel([],X,Y).

podziel([X],[X|_],Y).
podziel([A,B|Tail],[A],[B]):-
    podziel(Tail,[A|Rest],[B,Rest2]).
    
    

