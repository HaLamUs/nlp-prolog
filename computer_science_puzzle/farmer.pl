% 2 bank, 4 object: 1 man, 3 animal
% define state, 1 list 2 objects 
% use list for describe the state, only list can use recursive 
% [farm, fox, goose, bean]// chỉ có 0 và 1 
% [[1, 1, 1, 1], [0, 0, 0, 0]]
% liệt kê tất cả thao tác 
goal([0, 0, 0, 0, 1, 1, 1, 1]). % state cua minh 
% operation
farmer_cross_alone_fw([0, _, _, _, 1, _, _, _]).
farmer_cross_alone_bw([1, _, _, _, 0, _, _, _]).
farmer_cross_fox_fw([0, 0, _, _, 1, 1, _, _]).
farmer_cross_fox_bw([1, 1, _, _, 0, 0, _, _]).
farmer_cross_goose_fw([0, _, 0, _, 1, _, 1, _]).
farmer_cross_goose_bw([1, _, 1, _, 0, _, 0, _]).
farmer_cross_bean_fw([0, _, _, 0, 1, _, _, 1]).
farmer_cross_bean_bw([1, _, _, 1, 0, _, _, 0]).
% condition
% fox eat goose, goose eat beans IF alone
is_safe() :- [0, 1, 0, 1, 1, 0, 1, 0]; [1, 0, 1, 0, 0, 1, 0, 1]. 

% move
% 1 farm + {fox, goose, beans}
move(X) :- farmer_cross_alone_fw(X), is_safe().
move(X) :- farmer_cross_alone_bw(X), is_safe().
move(X) :- farmer_cross_fox_fw(X), is_safe().
move(X) :- farmer_cross_fox_bw(X), is_safe().
move(X) :- farmer_cross_goose_fw(X), is_safe().
move(X) :- farmer_cross_goose_bw(X), is_safe().
move(X) :- farmer_cross_bean_fw(X), is_safe().
move(X) :- farmer_cross_bean_bw(X), is_safe().

% dfs(goal,visited, answer).
dfs(Goal, [Goal|_], [Goal]).


dfs(Goal,[Current|Past],[Current|Future]):- graph(Current,Next),
                not(member(Next,Past)), dfs(Goal,[Next,Current|Past], Future).


% transport(start_state, [persons], endstate).
% dfs(X, P, [X|P]) :- goal(X). 
% dfs(X, P, FullPath) :- move(X), dfs(X, [X|P], FullPath).

% Tham khao https://nulldereference.wordpress.com/2012/02/17/how-to-solve-the-fox-goose-and-bag-of-beans-puzzle-with-prolog/
% https://stackoverflow.com/questions/19620072/prolog-fox-goose-grain-riddle-not-showing-output