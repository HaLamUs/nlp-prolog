% tower of ha noi
% move, valid, dfs
% version 1: 4 cai dia (asc), 3 cot
% 4 dia = [1, 2, 3, 4]
% 3 cot = [7, 8, 9]
goal([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1]).
start([0, 0, 0, 0, 9]).
% Disk 1 move? pre condition

 move([1, B1, C1, D1, 0, B2, C2, D2, A3, B3, C3, D3], [0, B1, C1, D1, 1, B2, C2, D2, A3, B3, C3, D3]).
 move([1, B1, C1, D1, A2, B2, C2, D2, 0, B3, C3, D3], [0, B1, C1, D1, A2, B2, C2, D2, 1, B3, C3, D3]).
 move([0, B1, C1, D1, 1, B2, C2, D2, A3, B3, C3, D3], [1, B1, C1, D1, 0, B2, C2, D2, A3, B3, C3, D3]).
 move([A1, B1, C1, D1, 1, B2, C2, D2, 0, B3, C3, D3], [A1, B1, C1, D1, 0, B2, C2, D2, 1, B3, C3, D3]).
 move([A1, B1, C1, D1, 0, B2, C2, D2, 1, B3, C3, D3], [A1, B1, C1, D1, 1, B2, C2, D2, 0, B3, C3, D3]).
 move([0, B1, C1, D1, A2, B2, C2, D2, 1, B3, C3, D3], [1, B1, C1, D1, A2, B2, C2, D2, 0, B3, C3, D3]).


% Disk 2 move? pre condition
 move([0, 1, C1, D1, 0, 0, C2, D2, A3, B3, C3, D3], [0, 0, C1, D1, 0, 1, C2, D2, A3, B3, C3, D3]).
 move([0, 1, C1, D1, A2, B2, C2, D2, 0, 0, C3, D3], [0, 0, C1, D1, A2, B2, C2, D2, 0, 1, C3, D3]).
 move([0, 0, C1, D1, 0, 1, C2, D2, A3, B3, C3, D3], [0, 1, C1, D1, 0, 0, C2, D2, A3, B3, C3, D3]).
 move([A1, B1, C1, D1, 0, 1, C2, D2, 0, 0, C3, D3], [A1, B1, C1, D1, 0, 0, C2, D2, 0, 1, C3, D3]).
 move([0, 0, C1, D1, A2, B2, C2, D2, 0, 1, C3, D3], [0, 1, C1, D1, A2, B2, C2, D2, 0, 0, C3, D3]).
 move([A1, B1, C1, D1, 0, 0, C2, D2, 0, 1, C3, D3], [A1, B1, C1, D1, 0, 1, C2, D2, 0, 1, C3, D3]).

% DISK 3 MOVE
move([0, 0, 1, D1, 0, 0, 0, D2, A3, B3, C3, D3], [0, 0, 0, D1, 0, 0, 1, D2, A3, B3, C3, D3]).
move([0, 0, 1, D1, A2, B2, C2, D2, 0, 0, 0, D3], [0, 0, 0, D1, A2, B2, C2, D2, 0, 0, 1, D3]).
move([0, 0, 0, D1, 0, 0, 1, D2, A3, B3, C3, D3], [0, 0, 1, D1, 0, 0, 0, D2, A3, B3, C3, D3]).
move([A1, B1, C1, D1, 0, 0, 1, D2, 0, 0, 0, D3], [A1, B1, C1, D1, 0, 0, 0, D2, 0, 0, 1, D3]).
move([0, 0, 0, D1, A2, B2, C2, D2, 0, 0, 1, D3], [0, 0, 1, D1, A2, B2, C2, D2, 0, 0, 0, D3]).
move([A1, B1, C1, D1, 0, 0, 0, D2, 0, 0, 1, D3], [A1, B1, C1, D1, 0, 0, 1, D2, 0, 0, 0, D3]).

% DISK 4 MOVE
move([0, 0, 0, 1, 0, 0, 0, 0, A3, B3, C3, D3], [0, 0, 0, 0, 0, 0, 0, 1, A3, B3, C3, D3]).
move([0, 0, 0, 1, A2, B2, C2, D2, 0, 0, 0, 0], [0, 0, 0, 0, A2, B2, C2, D2, 0, 0, 0, 1]).
move([A1, B1, C1, D1, 0, 0, 0, 1, 0, 0, 0, 0], [A1, B1, C1, D1, 0, 0, 0, 0, 0, 0, 0, 1]).
move([0, 0, 0, 0, 0, 0, 0, 1, A3, B3, C3, D3], [0, 0, 0, 1, 0, 0, 0, 0, A3, B3, C3, D3]).
move([0, 0, 0, 0, A2, B2, C2, D2, 0, 0, 0, 1], [0, 0, 0, 1, A2, B2, C2, D2, 0, 0, 0, 0]).
move([A1, B1, C1, D1, 0, 0, 0, 0, 0, 0, 0, 1], [A1, B1, C1, D1, 0, 0, 0, 1, 0, 0, 0, 0]).

% valid([A, B, C, D, _]):- A < B, B < C, C < D.

dfs(F, P, [F|P]):- goal(F).
dfs(F, P, FULL):- move(F, X),\+ member(X, P), dfs(X, [X|P], FULL).
% nhớ có cái member không nó out of stack