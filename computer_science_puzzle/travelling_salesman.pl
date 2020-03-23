find_min([], P, P).
find_min([X|T], Y, P):- X < Y, find_min(T, X, P).
find_min([X|T], Y, P):- X >= Y, find_min(T, Y, P).  
find_min([X|T], P):- find_min(T, X, P). 

start([1, 0, 0, 0, 0, a]).
goal([1, 1, 1, 1, _, _]).

% tại điểm start của mình bắt đầu từ A nên không có chiều ngc lại như mấy case khác 
moveable([1, 0, C, D, LB, a], [1, 1, C, D, LA, b]) :-
    LA is LB + 1. % A>B 1
moveable([1, B, 0, D, LB, a], [1, B, 1, D, LA, c]) :-
    LA is LB+4. %A>C 4
moveable([1, B, C, 0, LB, a], [1, B, C, 1, LA, d]):- LA is LB + 3. %A>D 3

moveable([A, 1, 0, D, LB, b], [A, 1, 1, D, LA, c]):- LA is LB + 6. %B>C 6
moveable([A, 0, 1, D, LB, c], [A, 1, 1, D, LA, b]) :-
    LA is LB+6. %C>B 6
moveable([A, 1, C, 0, LB, b], [A, 1, C, 1, LA, d]) :-
    LA is LB+1. %B>D 1
moveable([A, 0, C, 1, LB, d], [A, 1, C, 1, LA, b]) :-
    LA is LB+1. %D>B 1

moveable([A, B, 1, 0, LB, c], [ A, B, 1, 1, LA, d]):- LA is LB + 3. %C>D 3
moveable([A, B, 0, 1, LB, d], [A, B, 1, 1, LA, c]) :-
    LA is LB+3. %D>C 3

% fuck([A, B, 1, 0, LB], [ A, B, 1, 1, LA]):- LA is LB + 3.
dfs(X, P, [X|P]) :-
    goal(X).
dfs(X, P, FULL):- moveable(X, Y), \+ member(Y, P), dfs(Y, [Y|P], FULL).

%phải tách làm 2 phần find all path
% 2. find shortest path 

% https://stackoverflow.com/questions/2564058/search-all-paths-and-the-shortest-path-for-a-graph-prolog // mấy thằng này cũng làm thế 