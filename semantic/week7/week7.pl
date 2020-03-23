% nam hoc bai
% nam hoc bai o truong
% nam hoc o truong 

% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% vb(X^Y^hoc(Y,X)) --> [hoc].
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% ======================================================================

% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% nn(truong) --> [truong].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% in(X^o(X)) --> [o].
% pp(PP) --> in(IN), np(NP), {reduce(IN, NP, PP)}.
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
% vp(VP) --> vb(VB), np(NP), pp(PP), {reduce(VB, NP, T1), reduce(T1, PP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% ======================================================================

% nnp(nam) --> [nam].
% nn(truong) --> [truong].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% in(X^o(X)) --> [o].
% pp(PP) --> in(IN), np(NP), {reduce(IN, NP, PP)}.
% vb(X^Y^hoc(Y, X)) --> [hoc].
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
% vp(VP) --> vb(VB), np(NP), pp(PP), {reduce(VB, NP, T1), reduce(T1, PP, VP)}.
% vp(VP) --> vb(VB), pp(PP), {reduce(VB, PP, VP)}.
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% ======================================================================

% chỉ quan tâm động từ, tính từ, giới từ (bỏ qua trạng từ, UN, CD)
% nnp(nam) --> [nam].
% nn(xe) --> [xe].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% np(NP) --> cd(_), un(_), nn(NN), adjp(ADJP), {reduce(ADJP, NN, NP)}.
% rb(moi) --> [moi].
% cd(mot) --> [mot].
% un(chiec) --> [chiec].
% jj(X^moi(X)) --> [moi].
% adjp(JJ) --> jj(JJ).
% vb(X^Y^mua(Y, X)) --> [mua].
% vp(VP) --> rb(_), vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% ======================================================================

% đổi tên động từ, ràng buộc nghĩa, hoc1, hoc2, hoc3 
% nam hoc bai, nam hoc truong 

% advp(FS) --> pp(_), np(NP), {NP=sem~M..kind~place,FS=sem~M..kind~place}.
% vb(FS) --> [doc], {FS=sem~'doc'..arg1~(kind~human)..arg2~(kind~book)}.
% hoc vs humnan and place
% hoc vs human and book 

% nnp(nam) --> [nam].
% nn(truong) --> [truong].
% nn(xe) --> [xe].
% nn(que) --> [que].
% nn(thanh_pho) --> [thanh_pho].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% % np(NP) --> cd(_), un(_), nn(NN), adjp(ADJP), {reduce(ADJP, NN, NP)}.
% np(NP) --> cd(_), np(NP).
% np(NP) --> un(_), np(NP).
% np(NP) --> nn(NN), adjp(ADJP), {reduce(ADJP, NN, NP)}.
% rb(dang) --> [dang].
% rb(hay) --> [hay].
% rb(moi) --> [moi].
% in(X^o(X)) --> [o].
% cd(mot) --> [mot].
% un(chiec) --> [chiec].
% jj(X^moi(X)) --> [moi].
% adjp(JJ) --> jj(JJ).
% pp(PP) --> in(IN), np(NP), {reduce(IN, NP, PP)}.
% vb(X^Y^hoc(Y, X)) --> [hoc].
% vb(X^Y^ve(Y, X)) --> [ve].
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
% vb(X^Y^mua(Y, X)) --> [mua].
% vp(VP) --> vb(VB), np(NP), pp(PP), {reduce(VB, NP, T1), reduce(T1, PP, VP)}.
% vp(VP) --> vb(VB), pp(PP), {reduce(VB, PP, VP)}.
% vp(VP) --> rb(_), vb(VB), pp(PP), {reduce(VB, PP, VP)}.
% vp(VP) --> vb(VB), np(NP), {reduce(VB, NP, VP)}.
% vp(VP) --> rb(_), vb(VB), np(NP), {reduce(VB, NP, VP)}.
% s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).



% 3 phương pháp: ubg, lambda, quan hệ ngữ nghĩa (ngữ pháp phụ thuộc)
% ngữ nghĩa: Vd: hoc(Nam, bai), phân tích theo động từ 

% ======================================================================
% cái này dùng kèm với UBG 
% nnp(nam,FS) --> [nam], {FS=sem~'nam'..kind~person}.
% nn(bai,FS) --> [bai], {FS=sem~'bai'..kind~book}.
% np(NP, FS) --> nn(NP, FS).
% np(NP, FS) --> nnp(NP, FS).
% vb(X^Y^hoc(Y,X), FS) --> [hoc], {FS=sem~'hoc'..arg1~person..arg2~book}.
% vp(VP, FS) --> vb(VB, FS1), np(NP, FS2), {reduce(VB, NP, VP), 
% FS2=sem~_..kind~Y,FS1=sem~Z..arg1~R..arg2~Y,
% FS=sem~Z..arg1~R..arg2~Y
% }.
% s(S, FS) --> np(NP, FS1), vp(VP, FS2), {reduce(VP, NP, S),
% FS1=sem~_..kind~Y,FS2=sem~Z..arg1~Y..arg2~R,
% FS=sem~Z..arg1~Y..arg2~R
% }.
% reduce(X^Y,X, Y).

% ======================================================================

% nam hoc bai
% nnp(nnp(nam), human) --> [nam]. để in cây cú pháp 
% nnp(nam, human) --> [nam].
% nn(bai, lesson) --> [bai].
% vb(X^Y^hoc(Y,X),human, lesson) --> [hoc].
% np(X, R) --> nnp(X, R).
% np(X, R) --> nn(X, R).
% vp(VP, R) --> vb(NP^VP, R, L), np(NP, L).
% s(S) --> np(NP, R), vp(NP^S, R).

% ======================================================================

% nnp(nam, human) --> [nam].
% nn(bai, lesson) --> [bai].
% np(NP, R) --> nn(NP, R).
% np(NP, R) --> nnp(NP, R).
% vb(X^Y^hoc(Y,X), human, lesson) --> [hoc].
% vp(VP, R) --> vb(VB, R, L), np(NP, L), {reduce(VB, NP, VP)}.
% s(S) --> np(NP, R), vp(VP, R), {reduce(VP, NP, S)}.
% reduce(X^Y,X, Y).

% ======================================================================

% nnp(nam) --> [nam].
% nn(truong) --> [truong].
% nn(bai) --> [bai].
% np(NP) --> nn(NP).
% np(NP) --> nnp(NP).
% in(X^o(X)) --> [o].
% pp(PP) --> in(NP^PP), np(NP).
% vb(X^Y^hoc(Y, X)) --> [hoc].
% vb(X^Y^Z^hoc(Z, X, Y)) --> [hoc].
% vp(VP) --> vb(NP^PP^VP), np(NP), pp(PP).
% vp(VP) --> vb(PP^VP), pp(PP).
% vp(VP) --> vb(NP^VP), np(NP).
% s(S) --> np(NP), vp(NP^S).
% reduce(X^Y,X, Y).

% ======================================================================
nnp(nam, human) --> [nam].
nn(truong, school) --> [truong].
nn(bai, lesson) --> [bai].
np(NP, R) --> nn(NP, R).
np(NP, R) --> nnp(NP, R).
in(X^o(X), school) --> [o].
pp(PP, place) --> in(NP^PP, R), np(NP, R).
vb(X^Y^hoc(Y, X), human, lesson) --> [hoc].
vb(X^Y^hoc(Y, X), human, place) --> [hoc].
vb(X^Y^Z^hoc(Z, X, Y), human, lesson, place) --> [hoc].
vp(VP, R) --> vb(NP^PP^VP, R, L, K), np(NP, L), pp(PP, K).
vp(VP, R) --> vb(PP^VP, R, L), pp(PP, L).
vp(VP, R) --> vb(NP^VP, R, L), np(NP, L).
s(S) --> np(NP, R), vp(NP^S, R).
