% 2 bank, 4 object: 1 man, 3 animal
% define state, 1 list 2 objects 
% use list for describe the state, only list can use recursive 
% [farm, fox, goose, bean]// chỉ có 0 và 1 
% [[1, 1, 1, 1], [0, 0, 0, 0]]
% liệt kê tất cả thao tác 
% goal([0, 0, 0, 0]). % state cua minh 
goal([1, 1, 1, 1]).
% operation
farmer_cross_alone_fw([0, _, _, _],[ 1, _, _, _]).
farmer_cross_alone_bw([1, _, _, _],[ 0, _, _, _]).
farmer_cross_fox_fw([0, 0, _, _, 1],[ 1, _, _]).
farmer_cross_fox_bw([1, 1, _, _, 0],[ 0, _, _]).
farmer_cross_goose_fw([0, _, 0, _],[ 1, _, 1, _]).
farmer_cross_goose_bw([1, _, 1, _],[ 0, _, 0, _]).
farmer_cross_bean_fw([0, _, _, 0],[ 1, _, _, 1]).
farmer_cross_bean_bw([1, _, _, 1],[ 0, _, _, 0]).
is_not_safe([0, 1, 1, 1]).
is_not_safe([0, 1, 1, 0]).
is_not_safe([0, 0, 1, 1]).


% move
% 1 farm + {fox, goose, beans}
move(X, Y) :- farmer_cross_alone_fw(X, Y).% , is_not_safe(Y).
move(X, Y) :- farmer_cross_alone_bw(X, Y).% , is_not_safe(Y).
move(X, Y) :- farmer_cross_fox_fw(X, Y).%, is_not_safe(Y).
move(X, Y) :- farmer_cross_fox_bw(X, Y).%, is_not_safe(Y).
move(X, Y) :- farmer_cross_goose_fw(X, Y).%, is_not_safe(Y).
move(X, Y) :- farmer_cross_goose_bw(X, Y).%, is_not_safe(Y).
move(X, Y) :- farmer_cross_bean_fw(X, Y).%, is_not_safe(Y).
move(X, Y) :- farmer_cross_bean_bw(X, Y).%, is_not_safe(Y).

dfs(X, P, [X|P]) :- goal(X).
dfs(X, P, FullPath) :- move(X, Y), is_not_safe(Y), X \= Y, \+ member(Y, P), dfs(Y, [Y|P], FullPath).


% % dfs(goal,visited, answer).
% dfs(Goal, [Goal|_], [Goal]).


% dfs(Goal,[Current|Past],[Current|Future]):- goal(Current, Future), move(Current,Next), not(is_not_safe(Next)),
%                 not(member(Next,Past)), dfs(Goal,[Next,Current|Past], Future).

% đề thi năm ngoái là tháp hà nội 
% 30 trang đầu => đọc sơ sơ 
% đọc formal method từ trang 35 về sau, chứng minh tính đúng đắn của chương trình, đọc hiểu cách chứng minh, tìm vd rồi code lại, làm lại 1 số vd, giải thích lại trình bày trong 10 trang 
% làm ở chapter 3, làm cho đến bữa thi 