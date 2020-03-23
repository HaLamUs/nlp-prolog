
start([2, 2, 1, 1, 0, 0, 0, 0]).
goal([0, 0, 0, 0, 2, 2, 1, 1]).

% 1 adult cross left to right
move([AL, CL, DL, 1, AR, CR, DR, 0], [AL2, CL, DL, 0, AR2, CR, DR, 1]):-
AL2 is AL - 1,
AR2 is AR + 1.
% 1 adult cross right to left
move([AL, CL, DL, 0, AR, CR, DR, 1], [AL2, CL, DL, 1, AR2, CR, DR, 0]):-
AR2 is AR - 1,
AL2 is AL + 1.

% 1 child cross left to right
move([AL, CL, DL, 1, AR, CR, DR, 0], [AL, CL2, DL, 0, AR, CR2, DR, 1]):-
CL2 is CL - 1,
CR2 is CR + 1.

% 1 child cross right to left
move([AL, CL, DL, 0, AR, CR, DR, 1], [AL, CL2, DL, 1, AR, CR2, DR, 0]):-
CL2 is CL + 1,
CR2 is CR - 1.

% 2 child cross left to right
move([AL, CL, DL, 1, AR, CR, DR, 0], [AL, CL2, DL, 0, AR, CR2, DR, 1]):-
CL2 is CL - 2,
CR2 is CR + 2.

% 2 child cross left to right
move([AL, CL, DL, 0, AR, CR, DR, 1], [AL, CL2, DL, 1, AR, CR2, DR, 0]):-
CL2 is CL + 2,
CR2 is CR - 2.

% Driver cross left to right (only one)
move([AL, CL, 1, 1, AR, CR, 0, 0], [AL, CL, 0, 0, AR, CR, 1, 1]).
valid([AL, CL, _, _, AR, CR, _, _]):- 
AL >= 0, CL >= 0, AR >= 0, CR >= 0.

dfs(X, P, [X|P]):- goal(X).
dfs(X, P, FULL):- move(X, N), valid(N), \+ member(N,P), dfs(N, [N|P], FULL).

% query dfs([2, 2, 1, 1, 0, 0, 0, 0], [], P).