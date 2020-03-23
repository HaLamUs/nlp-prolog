% nam hoc bai
% nam hoc bai o truong
% nam hoc o truong 
% nam moi mua mot chiec xe moi 
% nam dang hoc bai o truong
% nam hay ve que

% nnp(nam) --> [nam].
% nn(truong) --> [truong].
% nn(que) --> [que].
% nn(bai) --> [bai].
% nn(xe) --> [xe].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% np(NP) --> nn(NN), adjp(NN^NP).
% np(NP) --> un(_), np(NP).
% np(NP) --> cd(_), np(NP).
% rb(_) --> [hay].
% rb(_) --> [dang].
% rb(_) --> [moi].
% jj(X^moi(X)) --> [moi].
% cd(_) --> [mot].
% un(_) --> [chiec].
% in(X^o(X)) --> [o].
% adjp(ADJP) --> jj(ADJP).
% pp(PP) --> in(NP^PP), np(NP).
% vb(X^Y^hoc(Y, X)) --> [hoc].
% vb(X^Y^mua(Y, X)) --> [mua].
% vb(X^Y^ve(Y, X)) --> [ve].
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
% vp(VP) --> vb(NP^PP^VP), np(NP), pp(PP).
% vp(VP) --> vb(PP^VP), pp(PP).
% vp(VP) --> rb(_), vb(NP^PP^VP), np(NP), pp(PP).
% vp(VP) --> rb(_), vb(NP^VP), np(NP).
% vp(VP) --> vb(NP^VP), np(NP).
% s(S) --> np(NP), vp(NP^S).

% nam hay ve que
% nam dang hoc bai o truong
% nam moi mua mot chiec xe moi

nnp(nam, human) --> [nam].
nn(truong, place) --> [truong].
nn(bai, lesson) --> [bai].
nn(que, place) --> [que].
nn(xe, bike) --> [xe].
np(NP, R) --> nn(NP, R).
np(NP, R) --> nnp(NP, R).
% np(NP, R) --> nn(NN, R), adjp(NN^NP, R).
% np(NP, R) --> un(_, R), np(NP, R).
% np(NP, R) --> cd(_, R), np(NP, R).
np(NP, R) --> cd(_,R), un(_,R), nn(NN, R), adjp(NN^NP, R). % if using 3 above, it causes ambiguous Ex: nam, moi, chiec, chiec, chiec, xe 
rb(_) --> [hay].
rb(_) --> [dang].
rb(_) --> [moi].
cd(_, bike) --> [mot].
un(_, bike) --> [chiec].
jj(X^moi(X), bike) --> [moi].
adjp(ADJP, R) --> jj(ADJP, R).
in(X^o(X), place) --> [o].
pp(PP, at_place) --> in(NP^PP, R), np(NP, R).
vb(X^Y^hoc(Y, X), human, lesson) --> [hoc].
vb(X^Y^hoc(Y, X), human, at_place) --> [hoc].
vb(X^Y^ve(Y, X), human, place) --> [ve].
vb(X^Y^mua(Y, X), human, bike) --> [mua].
vb(X^Y^Z^hoc(Z, X, Y), human, lesson, at_place) --> [hoc].
vp(VP, R) --> vb(NP^PP^VP, R, L, K), np(NP, L), pp(PP, K).
vp(VP, R) --> vb(PP^VP, R, L), pp(PP, L).
vp(VP, R) --> vb(NP^VP, R, L), np(NP, L).
vp(VP, R) --> rb(_), vb(NP^VP, R, L), np(NP, L).
vp(VP, R) --> rb(_), vb(NP^PP^VP, R, L, K), np(NP, L), pp(PP, K).
s(S) --> np(NP, R), vp(NP^S, R).





% nnp(nam, human) --> [nam].
% nn(truong, place) --> [truong].
% nn(bai, lesson) --> [bai].
% nn(que, place) --> [que].
% np(NP, R) --> nn(NP, R).
% np(NP, R) --> nnp(NP, R).
% rb(_) --> [hay].
% rb(_) --> [dang].
% in(X^o(X), place) --> [o].
% pp(PP, at_place) --> in(NP^PP, R), np(NP, R).
% vb(X^Y^hoc(Y, X), human, lesson) --> [hoc].
% vb(X^Y^hoc(Y, X), human, at_place) --> [hoc].
% vb(X^Y^ve(Y, X), human, place) --> [ve].
% vb(X^Y^Z^hoc(Z, X, Y), human, lesson, at_place) --> [hoc].
% vp(VP, R) --> vb(NP^PP^VP, R, L, K), np(NP, L), pp(PP, K).
% vp(VP, R) --> vb(PP^VP, R, L), pp(PP, L).
% vp(VP, R) --> vb(NP^VP, R, L), np(NP, L).
% vp(VP, R) --> rb(_), vb(NP^VP, R, L), np(NP, L).
% vp(VP, R) --> rb(_), vb(NP^PP^VP, R, L, K), np(NP, L), pp(PP, K).
% s(S) --> np(NP, R), vp(NP^S, R).

% vb(X^Y^Z^tang(Y, X, Z)) --> [tang].
% vp(VP) --> rb(_), vb(PRP^NP^VP), prp(PRP), np(NP).