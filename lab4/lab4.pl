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
    
