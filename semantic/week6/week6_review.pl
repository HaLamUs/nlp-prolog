% nam an com
% nnp(nam) --> [nam].
% nn(com) --> [com].
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% vb(X^Y^an(Y,X)) --> [an].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X,Y).

% ===============================================

% nam nuoi mot con ket thong_minh
% nnp(nam) --> [nam].
% nn(ket) --> [ket].
% jj(X^thong_minh(X)) --> [thong_minh].
% un(X^con(X)) --> [con].
% cd(_) --> [mot].
% np(NP) --> cd(_), un(UN), nn(NN), jj(JJ), {reduce(JJ, NN, T1), reduce(UN, T1, NP)}.
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% vb(X^Y^nuoi(Y,X)) --> [nuoi].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X,Y).

% ===============================================

% nam an com without reduce
% nnp(nam) --> [nam].
% nn(com) --> [com].
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% vb(X^(Y^an(Y,X))) --> [an].
% vp(VB) --> vb(NP^VB), np(NP).
% s(VP) --> np(NP), vp(NP^VP).

% ===============================================

% nam nuoi mot con ket thong_minh
% nnp(nam) --> [nam].
% nn(ket) --> [ket].
% jj(X^thong_minh(X)) --> [thong_minh].
% un(X^con(X)) --> [con].
% cd(_) --> [mot].
% np(UN) --> cd(_), un((NN^JJ)^UN), nn(NN), jj(NN^JJ).
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% vb(X^Y^nuoi(Y,X)) --> [nuoi].
% vp(VB) --> vb(NP^VB), np(NP).
% s(VP) --> np(NP), vp(NP^VP).
% Cái này bị lỗi np(X,[mot,con,ket,thong_minh],[]).
% X = con(ket^thong_minh(ket)) .

% ===============================================

% nnp(nam) --> [nam].
% nn(ket) --> [ket].
% jj(X^thong_minh(X)) --> [thong_minh].
% un(X^con(X)) --> [con].
% cd(_) --> [mot].
% np(UN) --> cd(_), un(JJ^UN), nn(NN), jj(NN^JJ).
% np(NP) --> nnp(NP).
% np(NP) --> nn(NP).
% vb(X^Y^nuoi(Y,X)) --> [nuoi].
% vp(VB) --> vb(NP^VB), np(NP).
% s(VP) --> np(NP), vp(NP^VP).

% np(NP) --> cd(_), un(UN), nn(NN), jj(JJ), {reduce(JJ, NN, T1), reduce(UN, T1, NP)}.
% np(UN) --> cd(_), un(JJ^UN), nn(NN), jj(NN^JJ).
% jj(NN^JJ).
% reduce(JJ, NN, T1)

% s(X,[nam,nuoi,mot,con,ket,thong_minh],[]).

% ===============================================

% nam hoc bai o truong 
nnp(nam) --> [nam].
nn(bai) --> [bai].
nn(truong) --> [truong].
in(X^o(X)) --> [o].
pp(IN) --> in(NP^IN), np(NP).
np(NP) --> nn(NP).
np(NP) --> nnp(NP).
vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
vp(VB) --> vb(NP^PP^VB), np(NP), pp(PP). 
% vp(VB) --> vb(NP^VB), np(NP), pp(PP^VB). // có vẻ giống bài ket thông minh NHƯNG sai bét nhé  
s(VP) --> np(NP), vp(NP^VP).

% vp(VP) --> vb(VB), np(NP), pp(PP), {reduce(VB, NP, R1), reduce(R1, PP, VP)}.