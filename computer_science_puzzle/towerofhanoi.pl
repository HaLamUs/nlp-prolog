% towersOfHanoi(N,A,B,C,A4,B4,C4) :- move(N,A,B,C,A4,B4,C4),!.

% move(1,[H|T],B,C,A1,B1,C1) :-  A1 = T,
%                                B1 = [H|B],
%                                C1 = C.
% move(N,A,B,C,A4,B4,C4) :-   N>1, 
%                             M is N-1, 
%                             move(M,A,C,B,A1,C1,B1), 
%                             move(1,A1,B1,C1,A2,B2,C2), 
%                             move(M,C2,B2,A2,C4,B4,A4).

%This object of this famous puzzle is to move N disks from the left peg to the right peg using the center peg as an auxiliary holding peg. At no time can a larger disk be placed upon a smaller disk
% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_3.html
% Hay nè: Lúc nào cxung lấy top disk của cột đó di chuyển  

%https://stackoverflow.com/a/745198

% Diễn giải rất tự nhiên
% Di chuyển tất cả các đĩa nhỏ hơn đĩa cuối cùng qua swap (cột giữa), move đĩa lớn nhất qua cột cuối cùng, rồi di chuyển ở cột giữa về cột cuối 

% The trick here is that this is a bottom-up algorithm. Essentially it boils down to:

% Move everything on top of the bottom disc to the swap (which is the recursive step)
% Move the bottom disc to the goal
% Move everything else from the swap to the goal
% Because it's bottom-up, you have to give the list starting with the bottom-most disc.

move(1, X, Y, _) :-
    write('Move top disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl. 
move(N, X, Y, Z) :-
    N>1,
    M is N-1,
    move(M, X, Z, Y), % move tất cả đĩa nhỏ hơn qua cột giữa 
    move(1, X, Y, _), % đây là điểm dừng của nó 
    move(M, Z, Y, X). % move cột giữa về cột cuối 