% Do tổ chức 8 con hậu thành 1 mảng đánh số từ 1 -> 8 ==> không thể có 2 con hậu trùng hàng trùng cột
% Dừng khi valid 
% Example: [4,2,7,3,6,8,5,1] means that the queen in the first column is in row 4, the queen in the second column is in row 2
% [1, 2, 3, 4, 5, 6, 7, 8]
% valid(4).
% % move(9,0).
% valid(A, B | Y):- abs(A - B) \= 1, valid(A).
% valid([], []).
% valid([A|Y], [B|T]):- valid(A, B), valid(A, T).

% QUEEN 1 MOVE
move([A, B, C, D, E, F, G, H], [B, A, C, D, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [C, B, A, D, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [D, B, C, A, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [E, B, C, D, A, F, G, H]).
move([A, B, C, D, E, F, G, H], [G, B, C, D, E, F, A, H]).
move([A, B, C, D, E, F, G, H], [H, B, C, D, E, F, G, A]).

% QUEEN 2 MOVE
move([A, B, C, D, E, F, G, H], [A, C, B, D, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, D, C, B, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, E, C, D, B, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, F, C, D, E, B, G, H]).
move([A, B, C, D, E, F, G, H], [A, G, C, D, E, F, B, H]).
move([A, B, C, D, E, F, G, H], [A, H, C, D, E, F, G, B]).

% QUEEN 3 MOVE
move([A, B, C, D, E, F, G, H], [A, B, D, C, E, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, E, D, C, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, F, D, E, C, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, G, D, E, F, C, H]).
move([A, B, C, D, E, F, G, H], [A, B, H, D, E, F, G, C]).

% QUEEN 4 MOVE
move([A, B, C, D, E, F, G, H], [A, B, C, E, D, F, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, F, E, D, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, G, E, F, D, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, H, E, F, G, D]).

% QUEEN 5 MOVE
move([A, B, C, D, E, F, G, H], [A, B, C, D, F, E, G, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, D, G, F, E, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, D, H, F, G, E]).

% QUEEN 6 MOVE
move([A, B, C, D, E, F, G, H], [A, B, C, D, E, G, F, H]).
move([A, B, C, D, E, F, G, H], [A, B, C, D, E, H, G, F]).

% QUEEN 7 MOVE
move([A, B, C, D, E, F, G, H], [A, B, C, D, E, F, H, G]).

valid([]).
valid([H|T]):- valid(T, H, 1), valid(T).
valid([], _, _).
valid([B|T], H, D):- H \= B,
                    U is abs(H - B),
                    U \= D,
                    D1 = D + 1,
                    valid(T, H, D1).

% permu(Xs,Zs) :- the list Zs is a permutation of the list Xs

permu([], []).
permu(Qs, [Y|Ys]) :-
    del(Y, Qs, Rs), 
    permu(Rs, Ys).

del(X, [X|Xs], Xs).
del(X, [Y|Ys], [Y|Zs]) :-
    del(X, Ys, Zs).

% loop_entry(X, Y) :- \+ valid(X), permu(X, P), \+member(P, P), loop_entry(P, Y). 

dfs(F, P, [F|P]):- valid(F).
dfs(F, P, FULL):- permu(F, X),\+ member(X, P), dfs(X, [X|P], FULL).

%query 
% dfs([1, 2, 3, 4, 5, 6, 7, 8], [], P).

% n_queens(N, Q):- range(1, N, Q), valid(Q).

% valid(X1, Y1, X2, Y2):- abs(X2 - X1) \= abs(Y2 - Y1).
% dfs(_, X):- valid(X).
% dfs(F, X) :-
%     permu(F, P),
%     \+ valid(P),
%     dfs(P, X).

% cái này gọn bọn nó dùng thư viện
% http://www.swi-prolog.org/pldoc/man?section=clpfd-n-queens

% n_queens(N, Qs) :-
%         length(Qs, N),
%         Qs ins 1..N,
%         safe_queens(Qs).


