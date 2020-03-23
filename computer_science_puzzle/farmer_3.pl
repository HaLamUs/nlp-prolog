% % [farm, fox, goose, bean]
% % goal([0, 0, 0, 0], [1, 1, 1, 1]).
% goal([0, 0, 0, 0]).

% farmer A -> B
% empty1([[1, _, _, _], [0, _, _, _]], [[0, _, _, _], [1, _, _, _]]).
% % trang thai cua 1 ben bo thoi

% move([Man1, _, _, _], [Man2, _, _, _]) :-
%     Man1 \= Man2 -> Man2 is 1 - Man1.
% move([Man1, Goose1, _, _], [Man2, Goose2, _, _]) :-
%     Man1\=Man2,
%     Goose1 \= Goose2 -> Man2 is 1 - Man1, Goose2 is 1 - Goose1.
% move([Man1, _, Fox1, _], [Man2, _, Fox2, _]) :-
%     Man1\=Man2,
%     Fox1\=Fox2 -> Man2 is 1 - Man1, Fox2 is 1 - Fox1.
% move([Man1, _, _, Bean1], [Man2, _, _, Bean2]) :-
%     Man1\=Man2,
%     Bean1\=Bean2 -> Man2 is 1 - Man1, Bean2 is 1 - Bean1.

% chi set trang thai cua 1 bo song thoi (luc dau, luc sau) cua 1 bo song
% vấn đề không có chỗ nào trả ra (lại) 1 cái mảng để chơi tiếp, cái này chỉ check đc true, false 
% empty1([_, X], [0, X]). full1([_, X], [4, X]).
%[][[][]][] nhớ là phải dùng chữ viết hoa nhé không là không ra 

% [farm, fox, goose, bean]
% goal([0, 0, 0, 0], [1, 1, 1, 1]).
goal([0, 0, 0, 0]).

move([_, G, F, B], [0, G, F, B]).
move([_, G, F, B], [1, G, F, B]).
move([_, _, F, B], [0, 0, F, B]).
move([_, _, F, B], [1, 1, F, B]).
move([_, G, _, B], [0, G, 0, B]).
move([_, G, _, B], [1, G, 1, B]).
move([_, G, F, _], [0, G, F, 0]).
move([_, G, F, _], [1, G, F, 1]).
transit(X, Y) :- move(X, Y).


valid([Man, Goose, Fox, Bean]) :- Man==Goose.
valid([Man, Goose, Fox, Bean]) :- Man==Bean, Fox \= Goose.
valid([Man, Goose, Fox, Bean]) :- Man==Fox, Bean \= Goose.

% test đệ quy trc để coi giải đúng hay không gõ: transit([1,1,1,1], L). Nếu mà ra kết quả L = ... thì ok giải đúng 
dfs(F, L, [F|L]) :- goal(F).
dfs(F, L, FullPath) :- move(F, N), valid(N), \+ member(N, L), dfs(N, [N|L], FullPath).


% p(left).
% p(right).
% valid((Man, Goose, Fox, Beans)) :-
%     p(Man),
%     p(Goose),
%     p(Fox),
%     p(Beans),
%     Man==Goose.
% valid((Man, Goose, Fox, Beans)) :-
%     p(Man),
%     p(Goose),
%     p(Fox),
%     p(Beans),
%     Man==Beans,
%     Goose\=Fox.
% valid((Man, Goose, Fox, Beans)) :-
%     p(Man),
%     p(Goose),
%     p(Fox),
%     p(Beans),
%     Man==Fox,
%     Goose\=Beans.

% step((Man1, Goose, Fox, Beans), 'Man',  (Man2, Goose, Fox, Beans)) :-
%     valid((Man2, Goose, Fox, Beans)),
%     Man1\=Man2.

% step((Man1, Goose1, Fox, Beans), 'Goose',  (Man2, Goose2, Fox, Beans)) :-
%     valid((Man2, Goose2, Fox, Beans)),
%     Man1\=Man2,
%     Goose1\=Goose2.

% step((Man1, Goose, Fox1, Beans), 'Fox',  (Man2, Goose, Fox2, Beans)) :-
%     valid((Man2, Goose, Fox2, Beans)),
%     Man1\=Man2,
%     Fox1\=Fox2.

% step((Man1, Goose, Fox, Beans1), 'Beans',  (Man2, Goose, Fox, Beans2)) :-
%     valid((Man2, Goose, Fox, Beans2)),
%     Man1\=Man2,
%     Beans1\=Beans2.

% reachable(S, _, [], S).
% reachable(S, Visited, [Step|Steps], G) :-
%     step(S, Step, Tmp),
%     not(member(Tmp, Visited)),
%     reachable(Tmp, [Tmp|Visited], Steps, G).

% start((left, left, left, left)).
% goal((right, right, right, right)).

% solve(Steps) :-
%     start(S),
%     goal(G),
%     reachable(S, [], Steps, G).

% dfs(F, L, [F|L]) :- goal(F, L).
% dfs(F, L, FullPath) :- move(F, N), valid(N), \+ member(N, L), dfs(N, [N|L], FullPath).