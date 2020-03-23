% gia dinh 4 nguoi, 2 adult, 2 child
% Bắt buộc trả lại thuyền cho ông lái đò 
% Ông lái đò chỉ qua 1 chiều thôi (không đc về)
% người lớn và con nít đều đi được thuyền 
% thuyền đi được 1 người lớn or 2 con nít (KHÔNG đc 1 lớn + 1 nít)
% biểu diễn ông lái đò riêng biệt vì chỉ đi qua 1 lần (khác với 2 người lớn)
%http://www.cse.unsw.edu.au/~billw/cs9414/notes/mandc/mandc.html
% https://github.com/marianafranco/missionaries-and-cannibals/blob/master/prolog/missionaries_and_cannibals.pl


% // Cài đặt: Lisp Works 

% start([1, 1, 1, 1, 1, left], [0, 0, 0, 0,0, right]).
start([2, 1, 2, left, 0, 0, 0]).
goal([0, 0, 0, right, 2, 1, 2]).
% di 1 nguoi lon
move([AL1, LL, CL, left, AR1, LR, CL], [AL2, LL, CL, right, AR2, LR, CL]) :- AL2 is AL1 - 1, AR2 is AR1 + 1.
move([AL1, LL, CL, right, AR1, LR, CL], [AL2, LL, CL, left, AR2, LR, CL]) :-
    AL2 is AL1 + 1,
    AR2 is AR1 - 1.
move([AL, LL, CL1, right, AR, LR, CR1], [AL, LL, CL2, left, AR, LR, CR2]) :-
    CL2 is CL1 + 2,
    CR2 is CR1 - 2.
move([AL, LL, CL1, left, AR, LR, CR1], [AL, LL, CL2, right, AR, LR, CR2]) :-
    CL2 is CL1 - 2,
    CR2 is CR1 + 2.
move([AL, LL, CL1, left, AR, LR, CR1], [AL, LL, CL2, right, AR, LR, CR2]) :-
    CL2 is CL1 - 1,
    CR2 is CR1 + 1.
move([AL, LL, CL1, right, AR, LR, CR1], [AL, LL, CL2, left, AR, LR, CR2]) :-
    CL2 is CL1 + 1,
    CR2 is CR1 - 1.
move([AL, LL1, CL, left, AR, LR1, CR], [AL, LL2, CL, right, AR, LR2, CR]) :-
    LL2 is LL1 - 1,
    LR2 is LR1 + 1.
valid([AL, LL, CL, _, AR, LR, CR]) :-
    AL >= 0, CL >= 0, LL >= 0, AR >= 0, CR >= 0, LR >= 0.

dfs(F, L, [F|L]) :-
    goal(F).
dfs(F, L, FullPath) :-
    move(F, N),
    valid(N),
    \+ member(N, L),
    dfs(N, [N|L], FullPath).
