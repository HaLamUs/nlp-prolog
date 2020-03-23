goal([5, _, _]). % trạng thái 
goal([_, 5, _]).
goal([_, _, 5]).

trans(X, Y, Z) :- empty1(X, Y, Z).
trans(X, Y, Z) :- empty2(X, Y, Z).
trans(X, Y, Z) :- empty3(X, Y, Z).
trans(X, Y, Z) :- full1(X, Y, Z).
trans(X, Y, Z) :- full2(X, Y, Z).
trans(X, Y, Z) :- full3(X, Y, Z).
trans(X, Y, Z) :- pour_1_2(X, Y, Z).
trans(X, Y, Z) :- pour_2_1(X, Y, Z).
trans(X, Y, Z) :- pour_1_3(X, Y, Z).
trans(X, Y, Z) :- pour_3_1(X, Y, Z).
trans(X, Y, Z) :- pour_2_3(X, Y, Z).
trans(X, Y, Z) :- pour_3_1(X, Y, Z).

empty1([_, X, Y], [0, X, Y], [0, X, Y]).
empty2([X, _, Y], [X, 0, Y], [X, 0, Y]).
empty3([X, Y, _], [X, Y, 0], [X, Y, 0]).
full1([_, X, Y], [9, X, Y], [9, X, Y]).
full2([X, _, Y], [X, 7, Y], [X, 7, Y]).
full3([X, Y, _], [X, Y, 3], [X, Y, 3]).
pour_1_2([A, B, _], [C, D, _], [C, D, _]) :- A + B >= 7 -> D is 7, C is A + B - 7.
pour_1_2([A, B, _], [C, D, _], [C, D, _]) :- A + B < 7 -> D is A + B, C is 0.
pour_2_1([A, B, _], [C, D, _], [C, D, _]) :- A + B >= 9 -> C is 9, D is B + A - 9.
pour_2_1([A, B, _], [C, D, _], [C, D, _]) :- A + B < 9 -> C is A + B, D is 0.

pour_1_3([A, _, B], [C, _, D], [C, _, D]) :- A + B >= 3 -> D is 3, C is A + B - 3.
pour_1_3([A, _, B], [C, _, D], [C, _, D]) :- A + B < 3 -> D is A + B, C is 0.
pour_3_1([A, _, B], [C, _, D], [C, _, D]) :- A + B >= 9 -> C is 9, D is B + A - 9.
pour_3_1([A, _, B], [C, _, D], [C, _, D]) :- A + B < 9 -> C is A + B, D is 0.

pour_2_3([_, A, B], [_, C, D], [_, C, D]) :- A + B >= 3 -> D is 7, C is A + B - 3.
pour_2_3([_, A, B], [_, C, D], [_, C, D]) :- A + B < 3 -> D is A + B, C is 0.
pour_3_2([_, A, B], [_, C, D], [_, C, D]) :- A + B >= 7 -> C is 9, D is B + A - 7.
pour_3_2([_, A, B], [_, C, D], [_, C, D]) :- A + B < 7 -> C is A + B, D is 0.



%solve(X, Y) :- trans(X, Y), goal([X, Y]).
%https://stackoverflow.com/questions/27065774/depth-first-search-algorithm-prolog#
% press w for print full path 
% [Y|P]: ký hiệu append array 
dfs(X, P, [X|P]) :- goal(X).
dfs(X, P, FullPath) :- trans(X, Y, Z), X \= Y, X \= Z, Y \= Z, \+ member(Y, P), dfs(Y, [Y|P], FullPath).