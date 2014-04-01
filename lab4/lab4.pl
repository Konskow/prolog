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
    odwroc(L,L).

przesun([H|Tail],X):-
    sklej(Tail,[H],X).

przeloz([],[]).
przeloz([H|Tail], [X|Rest]):-
    znaczy(H,X),
    przeloz(Tail,Rest).


nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

podziel([],[],[]).
podziel([X],[X],[]).
podziel([A,B|Tail], [A|T1], [B|T2]):-
    podziel(Tail, T1, T2).
    
przepisz([],[]).
przepisz([A|T],[A|Rest]):-
    przepisz(T,Rest).

podzbior([],[]).
podzbior([A|T],[A|T2]):-
    podzbior(T,T2).

podzbior([_|T], L2):-
    podzbior(T,L2).

%wyjmij([H|T],X):-
%    write(H),nl,
%    H = [_],
%    wyjmij(H,X).

%wyjmij(H,X):-
%    H \= [_].

%splaszcz([],X).
%splaszcz([H|T],X):-
%    wyjmij(H,X),
%    splaszcz(T,X).

%lista jest płaska kiedy głowa jest płaska i ogon jest płaski
%sklejenie płaskiej głowy z płaskim ogonem


%splaszcz(X,X).
%splaszcz([H|T], X):-
    
