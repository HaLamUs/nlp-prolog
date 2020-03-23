% 08-01-2019
% Câu 2: Dựa vào CFG đ/n DCG để vẽ cây cú pháp?

% nháp: Nam học bài 
% nnp(nnp(nam)) --> [nam]; ['Nam'].
% nn(nn(bai)) --> [bai].
% vb(vb(hoc)) --> [hoc].
% np(np(X)) --> nnp(X).
% np(np(X)) --> nn(X).
% vp(vp(X,Y)) --> vb(X), np(Y).
% s(s(X,Y)) --> np(X), vp(Y).

% truy vấn: s(X,[nam, hoc, bai],[]).

% Giải đề:
% - Nam quen Lan ở trường 
% - Nam thường học bài ở thư viện 
% - Lan đang ở thư viện 
% nnp(nnp(nam)) --> ['Nam'].
% nnp(nnp(lan)) --> ['Lan'].
% nn(nn(truong)) --> [truong].
% vb(vb(quen)) --> [quen].
% in(in(o)) --> [o].
% np(np(X)) --> nnp(X).
% np(np(X)) --> nn(X).
% pp(pp(X, Y)) --> in(X), np(Y).
% vp(vp(X, Y, Z)) --> vb(X), np(Y), pp(Z).
% s(s(X, Y)) --> np(X), vp(Y). 
% truy vấn: s(X,[Nam, quen, Lan, o, truong],[]).
% X = s(np(nnp(nam)), vp(vb(quen), np(nnp(nam)), pp(in(o), np(nn(truong))))),
% Nam = Lan, Lan = nam

%=============================================

% - Nam quen Lan ở trường 
% - Nam thường học bài ở thư viện 
% - Lan đang ở thư viện 
% Version 2: full
% nnp(nnp(nam)) --> ['Nam'].
% nnp(nnp(lan)) --> ['Lan'].
% nn(nn(truong)) --> [truong].
% nn(nn(bai)) --> [bai].
% nn(nn(thu_vien)) --> [thu_vien].
% vb(vb(quen)) --> [quen].
% vb(vb(hoc)) --> [hoc].
% in(in(o)) --> [o].
% rb(rb(thuong)) --> [thuong].
% rb(rb(dang)) --> [dang].
% np(np(X)) --> nnp(X).
% np(np(X)) --> nn(X).
% pp(pp(X, Y)) --> in(X), np(Y).
% % vp(vp(X, Y, Z)) --> vb(X), np(Y), pp(Z).
% % vp(vp(X, Y, Z)) --> rb(X), vp(Y), np(Z).
% % vp(vp(X, Y)) --> vp(X), pp(Y).
% % vp(vp(X, Y)) --> rb(X), pp(Y). 

% vp1(vp1(X, Y)) --> vb(X), np(Y).
% vp2(vp2(X, Y, Z)) --> rb(X), vb(Y), np(Z).
% vp(vp(X, Y)) --> vp1(X), pp(Y). 
% vp(vp(X, Y)) --> rb(X), pp(Y). 
% vp(vp(X, Y)) --> vp2(X), pp(Y).

% s(s(X, Y)) --> np(X), vp(Y). 

%=============================================

% Câu 7: Chuyển DCG thành dạng mệnh đề prolog 

% nháp 
% s(s(X,Y), A, B) :- np(X, A, C), vp(Y, C, B).
% np(np(X), A, B) :- nnp(X, A, B).
% np(np(X), A, B) :- nn(X, A, B).
% vp(vp(X, Y), A, B) :- vb(X, A, C), np(Y, C, B).
% nnp(npp(Nam), [Nam|T], T).
% nn(nn(bai), [bai|T], T).
% vb(vb(hoc), [hoc|T], T).

% % - Nam quen Lan ở trường
% nnp(nnp(Nam), [Nam|T], T).
% nnp(nnp(Lan), [Lan|T], T).
% vb(vb(quen), [quen|T], T).
% nn(nn(truong), [truong|T], T).
% in(in(o), [o|T], T).
% s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
% np(np(X), A, B) :- nnp(X, A, B).
% np(np(X), A, B) :- nn(X, A, B).
% pp(pp(X, Y), A, B) :- in(X, A, C), np(Y, C, B).
% vp(vp(X, Y, Z), A, B) :- vb(X, A, C), np(Y, C, K), pp(Z, K, B).

%=============================================

% Full version 
% - Nam quen Lan ở trường 
% - Nam thường học bài ở thư viện 
% - Lan đang ở thư viện 
% nnp(nnp(Nam), [Nam|T], T).
% nnp(nnp(Lan), [Lan|T], T).
% vb(vb(quen), [quen|T], T).
% vb(vb(hoc), [hoc|T], T).
% nn(nn(truong), [truong|T], T).
% nn(nn(thu_vien), [thu_vien|T], T).
% rb(rb(thuong), [thuong|T], T).
% rb(rb(dang), [dang|T], T).
% in(in(o), [o|T], T).
% s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
% np(np(X), A, B) :- nnp(X, A, B).
% np(np(X), A, B) :- nn(X, A, B).
% pp(pp(X, Y), A, B) :- in(X, A, C), np(Y, C, B).
% vp2(vp2(X, Y), A, B) :- vb(X, A, C), np(Y, C, B).
% vp1(vp1(X, Y, Z), A, B) :- rb(X, A, C), vb(Y, C, K), np(Z, K, B).
% vp(vp(X, Y), A, B) :- vp1(X, A, C), pp(Y, C, B).
% vp(vp(X, Y), A, B) :- vp2(X, A, C), pp(Y, C, B).
% vp(vp(X, Y), A, B) :- rb(X, A, C), pp(Y, C, B).

%truy van
% ?- s(X, [Lan, dang, o, thu_vien],[]).
% X = s(np(nnp(Lan)), vp(rb(dang), pp(in(o), np(nnp(thu_vien))))) .

% === 09/01/2019
% - thu sang trên những cành bàng 
% - hoa chanh nở giữa vườn chanh 
% nn(nn(thu)) --> [thu].
% nn(nn(canh)) --> [canh].
% nn(nn(bang)) --> [bang].
% nn(nn(hoa)) --> [hoa].
% nn(nn(chanh)) --> [chanh].
% nn(nn(vuon)) --> [vuon].
% vb(vb(sang)) --> [sang].
% vb(vb(no)) --> [no].
% in(in(tren)) --> [tren].
% in(in(giua)) --> [giua].
% q(q(nhung)) --> [nhung].
% np(np(X)) --> nn(X).
% np(np(X, Y)) --> nn(X), nn(Y).
% np(np(X, Y)) --> q(X), np1(Y).
% np1(np1(X, Y)) --> nn(X), nn(Y).
% pp(pp(X, Y)) --> in(X), np(Y).
% vp(vp(X, Y)) --> vb(X), pp(Y).
% s(s(X, Y)) --> np(X), vp(Y).

% truy vấn: s(X,[nam, hoc, bai],[]).
% ?- s(X,[hoa, chanh, no, giua, vuon, chanh],[]).
% X = s(np(nn(hoa), nn(chanh)), vp(vb(no), pp(in(giua), np(nn(vuon), nn(chanh))))) ;

% ?- s(X,[thu, sang, tren, nhung, canh, bang],[]).
% X = s(np(nn(thu)), vp(vb(sang), pp(in(tren), np(q(nhung), np1(nn(canh), nn(bang)))))) ;

%=============================================
% normal clause

% nn(nn(thu), [thu|T], T).
% nn(nn(canh), [canh|T], T).
% nn(nn(bang), [bang|T], T).
% nn(nn(hoa), [hoa|T], T).
% nn(nn(chanh), [chanh|T], T).
% nn(nn(vuon), [vuon|T], T).
% vb(vb(sang), [sang|T], T).
% vb(vb(no), [no|T], T).
% in(in(tren), [tren|T], T).
% in(in(giua), [giua|T], T).
% q(q(nhung), [nhung|T], T).
% s(s(X,Y), A, B) :- np(X, A, C), vp(Y, C, B).
% np(np(X), A, B) :- nn(X, A, B).
% np(np(X, Y), A, B) :- nn(X, A, C), nn(Y, C, B).
% np(np(X, Y), A, B) :- q(X, A, C), np1(Y, C, B).
% vp(vp(X, Y), A, B) :- vb(X, A, C), pp(Y, C, B).
% pp(pp(X, Y), A, B) :- in(X, A, C), np(Y, C, B).
% np1(np1(X, Y), A, B) :- nn(X, A, C), nn(Y, C, B).
% truy vấn y như trên kia 

%=============================================
% làm lại bài hôm qua 
% nnp(nnp(nam)) --> ['Nam'].
% nnp(nnp(lan)) --> ['Lan'].
% nn(nn(truong)) --> [truong].
% nn(nn(bai)) --> [bai].
% nn(nn(thu_vien)) --> [thu_vien].
% vb(vb(quen)) --> [quen].
% vb(vb(hoc)) --> [hoc].
% in(in(o)) --> [o].
% rb(rb(thuong)) --> [thuong].
% rb(rb(dang)) --> [dang].
% s(s(X, Y)) --> np(X), vp(Y). 
% np(np(X)) --> nnp(X).
% np(np(X)) --> nn(X).
% pp(pp(X, Y)) --> in(X), np(Y).
% vp(vp(X, Y, Z)) --> vb(X), np(Y), pp(Z).
% vp(vp(X, Y)) --> vp1(X), pp(Y).
% vp(vp(X, Y)) --> rb(X), pp(Y).
% vp1(vp1(X, Y, Z)) --> rb(X), vb(Y), np(Z).

% truy van giong tren

%=============================================
% làm lại bài hôm qua 
% làm lại theo hướng mệnh đề 
nnp(nnp(Nam), [Nam|T], T).
nnp(nnp(Lan), [Lan|T], T).
vb(vb(quen), [quen|T], T).
vb(vb(hoc), [hoc|T], T).
vb(vb(o), [o|T], T).
nn(nn(truong), [truong|T], T).
nn(nn(thu_vien), [thu_vien|T], T).
rb(rb(thuong), [thuong|T], T).
rb(rb(dang), [dang|T], T).
in(in(o), [o|T], T).
s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
np(np(X), A, B) :- nnp(X, A, B).
np(np(X), A, B) :- nn(X, A, B).
pp(pp(X, Y), A, B) :- in(X, A, C), np(Y, C, B).
vp(vp(X, Y, Z), A, B) :- vb(X, A, C), np(Y, C, K), pp(Z, K, B).
vp(vp(X, Y), A, B) :- vp1(X, A, C), pp(Y, C, B).
vp(vp(X), A, B) :- vp1(X, A, B).
vp1(vp1(X, Y, Z), A, B) :- rb(X, A, C), vb(Y, C, K), np(Z, K, B).

% ============================
% làm lại theo hướng DCG 
% nnp(nnp(nam)) --> ['Nam']. % kỹ nhe chữ Nam viết thường 
% nnp(nnp(lan)) --> ['Lan'].
% vb(vb(quen)) --> [quen].
% vb(vb(hoc)) --> [hoc].
% vb(vb(o)) --> [o]. % từ ở là từ đồng nghĩa nhớ thêm vào 
% nn(nn(truong)) --> [truong].
% nn(nn(thu_vien)) --> [thu_vien].
% nn(nn(bai)) --> [bai].
% rb(rb(thuong)) --> [thuong].
% rb(rb(dang)) --> [dang].
% in(in(o)) --> [o]. % từ ở là từ đồng nghĩa nhớ thêm vào 
% s(s(X, Y)) --> np(X), vp(Y).
% np(np(X)) --> nn(X).
% np(np(X)) --> nnp(X).
% pp(pp(X, Y)) --> in(X), np(Y).
% vp(vp(X, Y, Z)) --> vb(X), np(Y), pp(Z).
% vp(vp(X, Y)) --> vp1(X), pp(Y).
% vp(vp(X)) --> vp1(X).
% vp1(vp1(X, Y, Z)) --> rb(X), vb(Y), np(Z).





