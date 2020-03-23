% liet ke tat ca cac trang thai
% liet ke tat ca cac thao tac (có thể)
% nhung dang bai toan tri tue nhan tao, de di thi
% dựa trên list để biểu diễn trạng thái
% để ràng buộc ở dfs  

% đi thi mô tả lại thuật giải là chủ yếu 

% http://www.cse.unsw.edu.au/~billw/cs9414/notes/mandc/mandc.html
% Problem: 3 missionaries, 3 cannibals, a boat 2 at a time, c <= m 
% start [3, 3, 1]
goal([0, 0, 0]). % state - done 
% operations: [m, m], [c, c], [m], [c], [m, c], [c, m]?
move([MB, C, 1], [MA, C, 0]) :- MB >= 2 -> MA is MB - 2.
move([MB, C, 0], [MA, C, 1]) :- MB =< 1 -> MA is MB + 2.
move([M, CB, 1], [M, CA, 0]) :- CB >= 2 -> CA is CB - 2.
move([M, CB, 0], [M, CA, 1]) :- CB =< 1 -> CA is CB + 2.
move([MB, C, 1], [MA, C, 0]) :- MB >= 1 -> MA is MB - 1.
move([MB, C, 0], [MA, C, 1]) :- MB =< 2 -> MA is MB + 1.
move([M, CB, 1], [M, CA, 0]) :- CB >= 1 -> CA is CB - 1.
move([M, CB, 0], [M, CA, 1]) :- CB =< 2 -> CA is CB + 1.
move([MB, CB, 1], [MA, CA, 0]) :- MB >= 1, CB >= 1 -> MA is MB - 1, CA is CB - 1.
move([MB, CB, 0], [MA, CA, 1]) :- MB =< 2, CB =< 2 -> MA is MB + 1, CA is CB + 1.
transit(X, Y) :- move(X, Y).

valid([M, C, _]) :- M >= C.

dfs(F, L, [F|L]) :- goal(F).
dfs(F, L, FullPath) :- move(F, N), valid(N), \+ member(N, L), dfs(N, [N|L], FullPath).






