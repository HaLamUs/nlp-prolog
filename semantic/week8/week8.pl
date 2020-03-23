% người vừa tặng ta vết thương đau ngọt ngào 
% không cần lambda 

% prp(nguoi) --> [nguoi].
% prp(ta) --> [ta].
% nn(vet_thuong) --> [vet_thuong].
% jj(X^dau(X)) --> [dau].
% jj(X^ngot_ngao(X)) --> [ngot_ngao].
% adjp(ADJP) --> jj(ADJP).
% rb(_) --> [vua].
% np(X) --> nn(X).
% np(X) --> prp(X).
% np(NP) --> nn(NN), adjp(NN^NP).
% s(S) --> np(NP), vp(NP^S).

% S -> NP1 VP 
% NP1 -> PrP(nguoi)
% VP -> RB VB Prp2 NP 
% Rb -> [vua]
% VB -> [tang]
% Prp2 -> [ta]
% NP2 -> NN(vet_thuong), JJ1(dau), JJ2(ngot_ngao)

% ========================================
% trạng từ bao giờ cũng đi kèm động từ 

% Ta cảm ơn tình nhân đã dìu ta đến mộ phần.
% S -> NP1 VP1 RB VP2
% NP1 -> PRP (ta)
% VP1 -> VB1(cam_on) NP1 
% NP1 -> NN1(tinh_nhan)
% RB -> [da]
% VP2 -> VB2(diu) PRP2(ta) PP  
% PP -> IN(den) NP2(mo_phan])

% S -> NP VP //ta
% VP -> VB NP VP // cam on tinh nhan - da diu ta den mo phan
% VP -> RB 

% prp(prp(ta)) --> [ta].
% nn(nn(tinh_nhan)) --> [tinh_nhan].
% np(np(X)) --> prp(X).
% np(np(X)) --> nn(X).
% vb(vb(cam_on)) --> [cam_on].
% vp(vp(X,Y)) --> vb(X), np(Y).
% s(s(X, Y)) --> np(X), vp(Y).


prp(nguoi) --> [nguoi].
prp(toi) --> [toi].
rb(vua) --> [vua].
nn(vet_thuong) --> [vet_thuong].
np(NP) --> prp(NP).
np(NP) --> nn(NP).
np(NP) --> nn(NN), adjp(ADJP), {reduce(ADJP, NN, NP)}.
vb(X^Y^Z^tang(Z,Y,X)) --> [tang].
jj(X^dau(X)) --> [dau].
jj(X^ngot_ngao(X)) --> [ngot_ngao].
adjp(X^R1^R2) --> jj(JJ1), jj(JJ2), {reduce(JJ1, X, R1), reduce(JJ2,X, R2)}.
vp(VP) --> rb(_), vb(VB), prp(PRP), np(NP), {reduce(VB, NP, R1), reduce(R1, PRP, VP)}.
s(S) --> np(NP), vp(VP), {reduce(VP, NP, S)}.
reduce(X^Y,X, Y).

% tang(nguoi, toi, dau(vet_thuong)^ngot_ngao(vet_thuong))
% X = vet_thuong 
% R1 = dau(vet_thuong)
% R2 = ngot_ngao(vet_thuong)
% X = dau(vet_thuong)^ngot_ngao(vet_thuong)
% adjp(X^R1^R2) ==> R1^R2 trả về X ==> nó phải mất lambda mới gọi là hết 