% nnp(nnp(nam)) --> [nam]; ['Nam'].
% nn(nn(bai)) --> [bai].
% vb(vb(hoc)) --> [hoc].
% np(np(X)) --> nnp(X).
% np(np(X)) --> nn(X).
% vp(vp(X,Y)) --> vb(X), np(Y).
% s(s(X,Y)) --> np(X), vp(Y).
% query s(X,[nam, hoc, bai],[]).

% implement cho ca 2 cau
% thu sang tren nhung canh bang 
% hoa chanh no giua vuon chanh \

% nn(nn(thu)) --> [thu].
% nn(nn(canh)) --> [canh].
% nn(nn(bang)) --> [bang].
% nn(nn(hoa)) --> [hoa].
% nn(nn(chanh)) --> [chanh].
% nn(nn(vuon)) --> [vuon].
% in(in(tren)) --> [tren].
% in(in(giua)) --> [giua].
% q(q(nhung)) --> [nhung].
% vb(vb(sang)) --> [sang].
% vb(vb(no)) --> [no].
% np(np(X)) --> nn(X).
% np(np(X, Y)) --> nn(X), nn(Y).
% np(np(X, Y)) --> q(X), np(Y).
% pp(pp(X, Y)) --> in(X), np(Y).
% vp(vp(X,Y)) --> vb(X), pp(Y).
% s(s(X,Y)) --> np(X), vp(Y).

% s(X,[thu, sang, tren, nhung, canh, bang],[]).
% X = s(np(nn(thu)), vp(vb(sang), pp(in(tren), np(q(nhung), np(nn(canh), nn(bang))))))


% s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
% np(np(X), A, B) :- nnp(X, A, B).
% np(np(X), A, B) :- nn(X, A, B).
% vp(vp(X, Y), A, B) :- vb(X, A, C), np(Y, C, B).
% nnp(nnp(nam),[nam|T], T).
% nn(nn(bai),[bai|T], T).
% vb(vb(hoc),[hoc|T], T).
% query s(X, [nam, hoc, bai], []).

% thu sang tren nhung canh bang
% hoa chanh no giua vuon chanh 
% build lên từ từ, thêm 1 luật test 1 luật 
s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
np(np(X), A, B) :- nn(X, A, B).
np(np(X, Y), A, B) :- nn(X, A, C), nn(Y, C, B).
pp(pp(X, Y), A, B) :- in(X, A, C), np(Y, C, B).
vp(vp(X, Y), A, B) :- vb(X, A, C), pp(Y, C, B). % lưu ý kỹ pp 
nn(nn(hoa),[hoa|T], T).
nn(nn(chanh), [chanh|T], T).
nn(nn(vuon), [vuon|T], T).
in(in(giua), [giua|T], T).
vb(vb(no),[no|T], T).

% query 
% s(X, [hoa, chanh, no, giua, vuon, chanh], []).
% X = s(np(nn(hoa), nn(chanh)), vp(vb(no), pp(in(giua), np(nn(vuon), nn(chanh))))).
