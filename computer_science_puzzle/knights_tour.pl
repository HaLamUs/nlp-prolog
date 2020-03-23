% There 8 types of knight moves:

% right 1 down 2
% left 1 down 2
% right 2 down 1
% left 2 down 1
% right 1 up 2
% left 1 up 2
% right 2 up 1
% left 2 up 1

% https://stackoverflow.com/questions/21066294/knights-tour-efficient-solution
% https://stackoverflow.com/questions/47581135/prolog-chess-knight-algorithm

% try([X, Y], [A, B]) :-     
%     X+1<8,
%     Y+2<8,
%     A is X+1,
%     B is Y+2.

% try(X, Y, Xmax, Ymax, A, B) :-
%     X+1<Xmax,
%     Y+2<Ymax,
%     A is X+1,
%     B is Y+2.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X+2<Xmax,
%     Y+1<Ymax,
%     A is X+2,
%     B is Y+1.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X+2<Xmax,
%     Y-1>=Ymax-Ymax,
%     A is X+2,
%     B is Y-1.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X+1<Xmax,
%     Y-2>=Ymax-Ymax,
%     A is X+1,
%     B is Y-2.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X-1>=Xmax-Xmax,
%     Y-2>=Ymax-Ymax,
%     A is X-1,
%     B is Y-2.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X-2>=Xmax-Xmax,
%     Y-1>=Ymax-Ymax,
%     A is X-2,
%     B is Y-1.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X-2>=Xmax-Xmax,
%     Y+1<Ymax,
%     A is X-2,
%     B is Y+1.
% try(X, Y, Xmax, Ymax, A, B) :-
%     X-1>=Xmax-Xmax,
%     Y+2<Ymax,
%     A is X-1,
%     B is Y+2.

% append([], POINT, [POINT]).
% append([H|T], POINT, [H|R]) :-
%     append(T, POINT, R).

% mymember(POINT, [POINT|_]).
% mymember(POINT, [_|R]) :-
%     mymember(POINT, R).

% move(X, Y, Xmax, Ymax, L) :-
%     (   try(X, Y, Xmax, Ymax, A, B),
%         not(mymember([A, B], L))
%     ->  write('X='),
%         write(A),
%         write(' '),
%         write('Y='),
%         write(B),
%         nl,
%         append(L, [A, B], L2),
%         move(A, B, Xmax, Ymax, L2)
%     ;   true
%     ).

valid_position(X, Y) :-
    X>=0,
    Y>=0,
    X<5,
    Y<5.

posneg(X, DX, Y) :-
    Y is X+DX.
posneg(X, DX, Y) :-
    Y is X-DX.

possible(X, Y, A, B) :-
    posneg(X, 2, A),
    posneg(Y, 1, B).
possible(X, Y, A, B) :-
    posneg(X, 1, A),
    posneg(Y, 2, B).

move([X, Y], [A, B]) :-
    possible(X, Y, A, B),
    valid_position(A, B).


% knight_move(P1, P2, [P1|P2], C) :-
%     C<1.
% knight_move(P1, X, Full, C) :-
%     C>=1,
%     C1 is C-1,
%     move(P1, P2),
%     \+ member(P2, X),
%     knight_move(P2, [P2|X], Full, C1).


% knight_move(P1, P1, [P1], C) :-
%     C<1.
% knight_move(P1, PZ, [P1|PT], C) :-
%     C>=1,
%     C1 is C-1,
%     move(P1, P2),
%     \+ member(P2, PT),
%     knight_move(P2, PZ, PT, C1).
% knight_move([1, 1], End, Path, 64).

dfs(F, P, [F|P], C):- C<1.
dfs(F, P, FULL, C):- 
    C>=1,
    C1 is C-1,
    move(F, P2),
    \+ member(P2, P),
    dfs(P2, [P2|P], FULL, C1).