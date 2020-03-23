% nnp(nam) --> [nam]. % coi là hằng số 
% vb(hoc(_,_)) --> [hoc]. % sẽ thay vào sau, để anonim cho nó khỏi báo lỗi 

% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% vb(X^Y^hoc(Y,X)) --> [hoc].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% % reduce(Arg^Function,Arg, Function).
% reduce(X^Y,X, Y).


% nam mua xe moi 
% nnp(nam) --> [nam].
% nn(xe) --> [xe].
% jj(X^moi(X)) --> [moi].
% adjp(JJ) --> jj(JJ).
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% np(NP) --> nn(NN), adjp(JJ), {reduce(JJ, NN, NP)}.
% vb(X^Y^mua(Y,X)) --> [mua].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% nam hoc bai o truong 
% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% nn(truong) --> [truong].
% in(X^o(X)) --> [o].
% pp(PP) --> in(IN), np(NP), {reduce(IN, NP, PP)}.
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% vb(X^Y^Z^hoc(Z,X,Y)) --> [hoc].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% vp1(VP1) --> vp(VP), pp(PP), {reduce(VP, PP, VP1)}.
% s(S) --> np(NP), vp1(VP1), {reduce(VP1, NP, S)}.
% reduce(X^Y,X, Y).


% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% nn(truong) --> [truong].
% in(X^o(X)) --> [o].
% pp(PP) --> in(IN), np(NP), {reduce(IN, NP, PP)}.
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc]. % should have enough params to contain 
% % Z là chữ nam vì Z đứng cuối cùng trong thứ tự X^Y^Z
% vp(VP) --> vb(VB), np(NP), pp(PP), {reduce(VB, NP, R1), reduce(R1, PP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y). % called fact NEVER 4get call 


nnp(nam) --> [nam].
nn(bai) --> [bai].
np(NP) --> nn(NP).
np(NP) --> nnp(NP).
vb(X^Y^hoc(Y,X)) --> [hoc].
vp(VB) --> vb(NP^VB), np(NP).
s(VP) --> np(NP), vp(NP^VP).

% goi ham thuc hien s(X,[nam,hoc,bai],[]).


% % nam hoc bai o truong 
% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% vb(X^Y^hoc(Y,X)) --> [hoc].
