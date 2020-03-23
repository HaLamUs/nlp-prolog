s(s(X, Y), A, B) :- np(X, A, C), vp(Y, C, B).
np(np(X), A, B) :- nnp(X, A, B).
np(np(X), A, B) :- nn(X, A, B).
vp(vp(X, Y), A, B) :- vb(X, A, C), np(Y, C, B).
nnp(nnp(nam),[nam|T], T).
nn(nn(bai),[bai|T], T).
vb(vb(hoc),[hoc|T], T).



% Truy vấn giải thích 
% ?- np(X, [nam, bai],[]).
% false.
% vì sau khi tách ra nó còn lại chữ bài nên nó bị sai 
% vì [bai] != []

% ?- np(X, [nam],[]).
% X = np(nnp(nam)) .

%s(X, [nam, hoc, bai],[]).


% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% vb(hoc(_,_)) --> [hoc].
% np(NNP) --> nnp(NNP).
% np(NN) --> nn(NN).
% vp(VB) --> vb(VB), np(NP), {arg(2, VB, NP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.

% truy vấn 
% s(S,[nam, hoc, bai],[]).
% vẽ ra cây hoc(nam, bai)
