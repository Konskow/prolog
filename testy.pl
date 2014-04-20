%Test 6
wypisz([H|T],H,T).

%Test 12
wypisz2([[tu,Y]|Z], Y, Z).

%Test 13

wypisz3([X,mruczy,X],X).

%Test 16

ffm(L,[X,Y,Z]) :- append(_,[X,Y,Z],L), Y>X, Y>Z.

%Test 17

q(FSL,N,S):- append(_,SL,FSL), append(S,_,SL), sumlist(S,N).

