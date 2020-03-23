% Nam thích đến thư viện để đọc sách 
% /Users/lamha/Desktop/codeExtra/prolog_code/semantic_dcg.pl
% tất cả tuỳ vào cái cây mà bạn vẽ ra 


% nnp(nam) --> [nam].
% nn(sach) --> [sach].
% np(thuvien) --> [thuvien].
% np(NN) --> nn(NN).
% np(NNP) --> nnp(NNP).

% vb1(doc(_)) --> [doc].
% cc(de(_)) --> [de].

% vp1(VB1) --> vb1(VB1), np(NP), {arg(1, VB1, NP)}.
% cp(CC) --> cc(CC), vp1(VP1), {arg(1, CC, VP1)}.

% vb2(den(_,_)) --> [den].
% vb2(thich(_, _)) --> [thich].

% vp2(VB2) --> vb2(VB2), np(NP), cp(CP), {arg(1, VB2, NP)}, {arg(2, VB2, CP)}.
% vp3(VB2) --> np(NP), vb2(VB2), {arg(1, VB2, NP)}.
% s(VP3) --> vp3(VP3), vp2(VP2), {arg(2, VP3, VP2)}.

% Viết ntn: vp3(VB2) --> vb2(VB2), np(NP), {arg(1, VB2, NP)}.
% Mà truy vấn vp3(X, [nam, thich], []). ==> false ==> do không đúng thứ tự 
% phải sửa thành: vp3(VB2) --> np(NP), vb2(VB2), {arg(1, VB2, NP)}.



% ============================ TASK 2

% Nhiều người cũng hay đến thư viện 
% nn(nguoi) --> [nguoi].
% nn(thuvien) --> [thuvien].
% np(NN) --> nn(NN).
% det(nhieu(_)) --> [nhieu].

% vb3(cung(_,_,_,_)) --> [cung].
% rb(hay) --> [hay].
% vb(den) --> [den].

% np1(DET) --> det(DET), 
% np(NP), 
% {arg(1, DET, NP)}.
% vp(VB3) --> vb3(VB3), rb(RB), vb(VB), np(NP),
%  {arg(2, VB3, RB)}, 
%  {arg(3, VB3, VB)},
%  {arg(4, VB3, NP)}.
% s(VP) --> np1(NP1), vp(VP), {arg(1, VP, NP1)}.

% Tất cả đều là hiệu số 
% ?- np1(X,[nhieu, thuvien, nguoi],[nguoi]).
% X = nhieu(thuvien).

% ?- vp2(X,[den, thuvien, de, doc, sach],[]).
% X = den(thuvien, de(doc(sach))) .

% ============================ TASK 3

% Thư viện có nhiều sách rất hay 
nn(thuvien) --> [thuvien].
nn(sach) --> [sach].
np(NN) --> nn(NN).
vb(co(_,_,_)) --> [co].
det(nhieu(_)) --> [nhieu].
np1(DET) --> det(DET), np(NP), {arg(1, DET, NP)}.
rb(rat(_)) --> [rat].
jj(hay) --> [hay].
adjp(RB) --> rb(RB), jj(JJ), {arg(1, RB, JJ)}.
vp(VB) --> vb(VB), np1(NP1), adjp(ADJP),
{arg(2, VB, NP1)},
{arg(3, VB, ADJP)}.
s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.

% ?- s(X, [thuvien, co, nhieu, sach, rat, hay],[]).
% X = co(thuvien, nhieu(sach), rat(hay)) .

% ?- vp(X, [cung, hay, den, thuvien],[]).
% X = cung(_4394, hay, den, thuvien).








