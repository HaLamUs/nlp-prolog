% nam hoc bai
% nnp(nnp(nam), human) --> [nam].
% nn(nn(bai), lesson) --> [bai].
% vb(vb(hoc), human, lesson) --> [hoc].
% np(np(X), R) --> nnp(X, R).
% np(np(X), R) --> nn(X, R).
% vp(vp(X, Y), P) --> vb(X, P, R), np(Y, R).
% R giống nhau thì nó là ràng buộc 
% P là cái biến human 
% X, Y là cái biến để lấy giá trị vd: Nam|học|bài 
% P, R để ràng buộc 
% s(s(X, Y)) --> np(X, R), vp(Y, R).

% s(X,[nam, hoc, bai],[]).
% X = s(np(nnp(nam)), vp(vb(hoc), np(nn(bai)))) .

% ?- s(X,[bai, hoc, nam],[]).
% false.

% ?- s(X,Y,[]).
% X = s(np(nnp(nam)), vp(vb(hoc), np(nn(bai)))),
% Y = [nam, hoc, bai] ;

% =========================
% nam an com, 2 cau
% nnp(nnp(nam), human) --> [nam].
% nn(nn(bai), lesson) --> [bai].
% nn(nn(com), food) --> [com].
% vb(vb(hoc), human, lesson) --> [hoc].
% vb(vb(an), human, food) --> [an].
% np(np(X), R) --> nnp(X, R).
% np(np(X), R) --> nn(X, R).
% vp(vp(X, Y), P) --> vb(X, P, R), np(Y, R).
% s(s(X, Y)) --> np(X, R), vp(Y, R).

% =========================
% nam hoc bai o truong, 3 pp (in, np)
% nam dang o truong
% Viết luật nó phải ràng buộc được nghĩa 

% =========================
% nam co mot cuon sach rat hay 
% nam nuoi mot con meo rat thong minh
nnp(nnp(nam), human) --> [nam].
un(un(mot), book) --> [mot].
un(un(mot), cat) --> [mot].
q(q(cuon), book) --> [cuon].
q(q(con), cat) --> [con].
nn(nn(sach), book) --> [sach].
nn(nn(meo), cat) --> [meo].
jj(jj(hay), book) --> [hay].
jj(jj(thong_minh), cat) --> [thong_minh].
rb(rb(rat), book) --> [rat].
rb(rb(rat), cat) --> [rat].
advp(advp(X, Y), book) --> rb(X, book), jj(Y, book).
advp(advp(X, Y), cat) --> rb(X, cat), jj(Y, cat).
vb(vb(co), human, book) --> [co].
vb(vb(nuoi), human, cat) --> [nuoi].
vp(vp(X, Y), P) --> vb(X, P, R), np(Y, R).
% P cho human, R cho book|cat 
np(np(X), R) --> nnp(X, R).
np(np(X), R) --> nn(X, R).
np(np(X, Y, Z, U), R) --> un(X, R), q(Y, R), nn(Z, R), advp(U, R).
s(s(X, Y)) --> np(X, R), vp(Y, R).


% nnp(nnp(nam), human) --> [nam].
% nn(nn(bai), lesson) --> [bai].
% vb(vb(hoc), human, lesson) --> [hoc].
% np(np(X), R) --> nnp(X, R).
% np(np(X), R) --> nn(X, R).
% vp(vp(X, Y), P) --> vb(X, P, R), np(Y, R).
% R giống nhau thì nó là ràng buộc 
% P là cái biến human 
% s(s(X, Y)) --> np(X, R), vp(Y, R).

% np(np(X, Y, Z, U), R) --> un(X, R), q(Y, R), nn(Z, R), jj(U, R).
% R ở đây chính là book, book xử dụng vp phía dưới 
% vb(vb(co), human, book) --> [co].
% np(np(X), R) --> nn(X, R).
% R ở đây là book nè 

% ?- s(X,Y,[]).
% X = s(np(nnp(nam)), vp(vb(co), np(nn(sach)))),
% Y = [nam, co, sach] ;
% X = s(np(nnp(nam)), vp(vb(co), np(un(mot), q(cuon), nn(sach), advp(rb(rat), jj(hay))))),
% Y = [nam, co, mot, cuon, sach, rat, hay] ;
% X = s(np(nnp(nam)), vp(vb(nuoi), np(nn(meo)))),
% Y = [nam, nuoi, meo] ;
% X = s(np(nnp(nam)), vp(vb(nuoi), np(un(mot), q(con), nn(meo), advp(rb(rat), jj(thong_minh))))),
% Y = [nam, nuoi, mot, con, meo, rat, thong_minh] ;

%========================
% nam hoc bai o truong, nam got tao bang dao 
% nnp(nnp(nam), human) -->[nam].
% nn(nn(dao), knife) -->[dao].
% nn(nn(tao), fruit) -->[tao].
% nn(nn(truong), school) -->[truong].
% nn(nn(bai), lesson) -->[bai].
% in(in(bang), knife) --> [bang].
% in(in(o), school) --> [o].
% pp(pp(X, Y), equipment) --> in(X, R), np(Y, R).
% pp(pp(X, Y), place) --> in(X, R), np(Y, R).
% np(np(X), R) --> nnp(X, R).
% np(np(X), R) --> nn(X, R).
% vb(vb(got), human, fruit, equipment) --> [got].
% vb(vb(hoc), human, lesson, place) --> [hoc].
% vp(vp(X, Y, Z), H) --> vb(X, H, F, PP), np(Y, F), pp(Z, PP).
% s(s(X, Y)) --> np(X, R), vp(Y, R).

% ?- pp(X,Y,Z,[]).
% X = pp(in(bang), np(nn(dao))),
% Y = instrument,
% Z = [bang, dao].

% ?- vp(X,Y,Z,[]).
% X = vp(vb(got), np(nn(tao)), pp(in(bang), np(nn(dao)))),
% Y = human,
% Z = [got, tao, bang, dao].

% ?- s(X,Y,[]).
% X = s(np(nnp(nam)), vp(vb(got), np(nn(tao)), pp(in(bang), np(nn(dao))))),
% Y = [nam, got, tao, bang, dao] ;

%Y = [nam, hoc, bai, bang, dao] ; ==> nó bị lỗi mà kệ đi 

