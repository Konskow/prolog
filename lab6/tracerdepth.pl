%
% Copyright by Ivan Bratko
%
%  Figure 23.2  A Prolog meta-interpreter for tracing programs
%  in pure Prolog.


% traced( Goal): execute Prolog goal Goal displaying trace information

traced( Goal)  :-
  traced( Goal, 0).

traced( true, Depth)  :-  !.                      % Red cut; Dept = depth of call

traced( ( Goal1, Goal2), Depth)  :-  !,           % Red cut
  traced( Goal1, Depth), 
  traced( Goal2, Depth).

traced( Goal, Depth)  :-
  display( 'Call: ', Goal, Depth),
  clause( Goal, Body),
  Depth1 is Depth + 1,
  traced( Body, Depth1),
  display( 'Exit: ', Goal, Depth),
  display_redo( Goal, Depth).

traced( Goal, Depth)  :-                          % All alternatives exhausted
  display( 'Fail: ', Goal, Depth),
  fail.

display( Message, Goal, Depth)  :-
  tab( Depth), write( Message),
  write( Goal), nl.

display_redo( Goal, Depth)  :-
  true                                           % First succeed simply
  ;
  display( 'Redo: ', Goal, Depth),               % Then announce backtracking
  fail.                                          % Force backtracking  
