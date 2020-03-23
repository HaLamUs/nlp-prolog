%Nam nuoi mot con ket thong_minh
% nn(FS) --> [ket], {FS=sem~'ket'..kind~animal}.
% nnp(FS) --> [nam], {FS=sem~'nam'..kind~human}.
% un(FS) --> [con], {FS=kind~animal}.
% jj(FS) --> [thong_minh], {FS=kind~animal}.
% cd(_) --> [mot].
% vb(FS) --> [nuoi], {FS=sem~'nuoi'..arg1~(kind~human)..arg2~(kind~animal)}.
% np(FS) --> nnp(FS).
% np(FS) --> cd(_), un(UN), nn(NN), jj(JJ), {UN=kind~X,NN=sem~N..kind~X,JJ=kind~X,FS=sem~N..kind~X}.
% vp(FS) --> vb(VB), np(NP), {VB=sem~N..arg1~(kind~X)..arg2~(kind~Y),NP=sem~M..kind~Y,FS=sem~N..arg1~(kind~X)..arg2~(sem~M..kind~Y)}.
% s(FS) --> np(NP), vp(VP), {NP=sem~N..kind~X, VP=sem~M..arg1~(kind~X)..arg2~(sem~Z..kind~Y), FS=sem~M..arg1~(sem~N..kind~X)..arg2~(sem~Z..kind~Y)}.

nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
nnp(FS) --> [lan], {FS=sem~'Lan'..kind~human}.
nn(FS) --> [truong], {FS=sem~'truong'..kind~place}.
nn(FS) --> [thu_vien], {FS=sem~'thu_vien'..kind~place}.
nn(FS) --> [sach], {FS=sem~'sach'..kind~book}.
pp(FS) --> [o], {FS='o'}.
advp(FS) --> pp(_), np(NP), {NP=sem~M..kind~place,FS=sem~M..kind~place}.
np(FS) --> nnp(FS).
np(FS) --> nn(FS).
vb(FS) --> [quen], {FS=sem~'quen'..arg1~(kind~human)..arg2~(kind~human)}.
vb(FS) --> [doc], {FS=sem~'doc'..arg1~(kind~human)..arg2~(kind~book)}.

vp(FS) --> vb(VB),np(NP), advp(ADVP),{VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,ADVP=sem~L..kind~H,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..kind~H)}.
s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X,VP=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~Z..kind~Y)..arg3~(sem~L..kind~H),M\=Z,FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~Z..kind~Y)..arg3~(sem~L..kind~H)}.