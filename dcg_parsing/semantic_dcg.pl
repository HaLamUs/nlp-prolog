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


% PP để dưới hay trên đều đc
% semantic tree
% nnp(nam) --> [nam].
% nn(bai) --> [bai].
% nn(truong) --> [truong].
% vb(hoc(_,_,_)) --> [hoc].
% in(o(_)) --> [o].
% np(NNP) --> nnp(NNP).
% np(NN) --> nn(NN).
% pp(IN) --> in(IN), np(NP), {arg(1, IN, NP)}.
% vp(VB) --> vb(VB), np(NP), pp(PP), {arg(2, VB, NP)}, {arg(3, VB, PP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.
% truy vấn 
%  s(S,[nam, hoc, bai, o, truong],[]).

% DCg để phân tích ngữ nhĩa cho các câu sau
% 1. Nam thích đến thư viện để đọc sách
% 2. Nhiều người cũng hay đến thư viện
% 3. Thư viện có nhiều sách rất hay 

% nam hoc bai o truong
% nam thich den thu vien 

% nnp(nam) --> [nam].
% % nn(sach) --> [sach].
% nn(thu_vien) --> [thu_vien].
% % vb(doc(_,_)) --> [doc]. 
% vbb(thich(_)) --> [thich].
% vb(den) --> [den].

% np(NNP) -->nnp(NNP).
% np(NN) --> nn(NN).
% % cc(de(_)) --> [de].
% % cp(CC) --> cc(CC), vp(VP), {arg(1, CC, VP)}.
% vbbp(VBB) --> vbb(VBB), vb(VB), {arg(1, VBB, VB)}.
% % vp(VP) --> vp(VP), np(NP), {arg(2, VP, NP)}. % de quy trai out of stack
% %1 đôn dưới lên 
% % 2 đặt tên khác

% vp(VBBP) --> vbbp(VBBP), np(NP), {arg(2, VBB, NP)}.

% % vp(VP) --> vp(VP), cp(CP), {arg(2, VP, CP)}.
% % vp(VB) --> vb(VB), np(NP), {arg(2, VB, NP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.


% % Nam thich den thu vien 
% nnp(nam) --> [nam].
% nn(thuvien) --> [thuvien].
% np(NNP) --> nnp(NNP).
% np(NN) --> nn(NN).
% vb(thich(_,_)) --> [thich].
% vbb(den(_)) --> [den].
% vbbp(VBB) --> vbb(VBB), np(NP), {arg(1, VBB, NP)}.
% vp(VB) --> vb(VB), vbbp(VBBP), {arg(2, VB, VBBP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.


% Nam thich den thu vien, nam doc sach 
% nnp(nam) --> [nam].
% nn(thuvien) --> [thuvien].
% nn(sach) --> [sach].
% cp(de(_)) --> [de].
% np(NNP) --> nnp(NNP).
% np(NN) --> nn(NN).
% vb(thich(_,_)) --> [thich].
% vb(doc(_,_)) --> [doc].
% vbb(den(_)) --> [den].
% vbbp(VBB) --> vbb(VBB), np(NP), {arg(1, VBB, NP)}.
% vp(VB) --> vb(VB), vbbp(VBBP), {arg(2, VB, VBBP)}.
% vp(VB) --> vb(VB), np(NP), {arg(2, VB, NP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.


% Nam thich den thu vien, nam doc sach 
% them tu de 
% đặt tên VP1, VP2, 
% truy vấn vp(VP,[thich, den, thuvien],[]).
% truy vấn vp(VP,[thich, den, thuvien, de, doc, sach],[]).

% np(NP,[nam],[]).
% NP = nam .


% /Users/lamha/Desktop/codeExtra/prolog_code/semantic_dcg.pl
% tất cả tuỳ vào cái cây mà bạn vẽ ra 

% nnp(nam) --> [nam].
% nn(thuvien) --> [thuvien].
% nn(sach) --> [sach].
% % cc(de(_)) --> [de].
% np(NNP) --> nnp(NNP).
% np(NN) --> nn(NN).
% vb3(thich(_,_,_)) --> [thich].
% vb1(den(_)) --> [den].
% vb1(doc(_)) --> [doc].
% vp1(VB1) --> vb1(VB1), np(NP), {arg(1, VB1, NP)}.
% vp3(VBB) --> vbb(VBB), np(NP), {arg(1, VBB, NP)}.
% cp(CC) --> cc(CC), vbbp(VBBP), {arg(1, CC, VBBP)}.
% vp(VB) --> vb(VB), vbbp(VBBP), {arg(2, VB, VBBP)}.
% vp(VB) --> vb(VB), cp(CP), {arg(3, VB, CP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.

nn(sach) --> [sach].
np(thuvien) --> [thuvien].
np(NN) --> nn(NN).

vb1(doc(_)) --> [doc].
cc(de(_)) --> [de].


vp1(VB1) --> vb1(VB1), np(NP), {arg(1, VB1, NP)}.
cp(CC) --> cc(CC), vp1(VP1), {arg(1, CC, VP1)}.

vb2(den(_,_)) --> [den].
vp2(VB2) --> vb2(VB2), np(NP), cp(CP), {arg(1, VB2, NP)}, {arg(2, VB2, CP)}.


% vp2(VB2) --> vp2(VP2), np(NP), {arg(1, VP2, NP)}.

% vp3(VP2) --> vp2(VP2), np(NP), {arg(1, VP2, NP)}.

% vp(VB) --> vb(VB), np(NP), pp(PP), {arg(2, VB, NP)}, {arg(3, VB, PP)}.

% vb(hoc(_,_)) --> [hoc].
% vp(VB) --> vb(VB), np(NP), {arg(2, VB, NP)}.
% s(VP) --> np(NP), vp(VP), {arg(1, VP, NP)}.