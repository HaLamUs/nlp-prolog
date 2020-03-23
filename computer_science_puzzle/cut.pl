a(1).
a(2).
b(3).
b(4).
b(5).

c(X, Y) :- a(X), b(Y). % vét cạn 
d(X, Y) :- !, a(X), b(Y). % ! cắt 
e(X, Y) :- a(X), !, b(Y).
f(X, Y) :- a(X), b(Y), !.

goal([2, _]). % trạng thái 
goal([_, 2]).

trans(X, Y) :- empty1(X, Y).
trans(X, Y) :- empty2(X, Y).
trans(X, Y) :- full1(X, Y).
trans(X, Y) :- full2(X, Y).
trans(X, Y) :- pour_1_2(X, Y).
trans(X, Y) :- pour_2_1(X, Y).

empty1([_, X], [0, X]).
empty2([X, _], [X, 0]).
full1([_, X], [4, X]).
full2([X, _], [X, 3]).
pour_1_2([A, B], [C, D]) :- A + B >= 3 -> D is 3, C is A + B - 3.
pour_1_2([A, B], [C, D]) :- A + B < 3 -> D is A + B, C is 0.
pour_2_1([A, B], [C, D]) :- A + B >= 4 -> C is 4, D is B + A - 4.
pour_2_1([A, B], [C, D]) :- A + B < 4 -> C is A + B, D is 0.

%solve(X, Y) :- trans(X, Y), goal([X, Y]).
%https://stackoverflow.com/questions/27065774/depth-first-search-algorithm-prolog#

% dfs([0,0], [], P). gõ cái này để chạy 
% test de hieu chuong trinh chay ntn go: trans([1,K], U).

dfs(X, P, [X|P]) :-
    goal(X).
dfs(X, P, FullPath) :- trans(X, Y), X \= Y, \+ member(Y, P), dfs(Y, [Y|P], FullPath).
% FullPath có head là X, có tail là P 

