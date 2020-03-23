
% nn(FS) --> [ban], {FS=sem~'ban'..kind~table}.
% un(FS) --> [cai], {FS=sem~'cai'..arg1~(kind~table)}.
% np(FS) --> un(UN), nn(NN), {UN=arg1~(kind~Y),NN=sem~N..kind~Y,FS=sem~N..kind~Y}.

% nn(FS) --> [ban], {FS=sem~'ban'..kind~table}.
% nn(FS) --> [sach], {FS=sem~'sach'..kind~book}.
% nn(FS) --> [ket], {FS=sem~'ket'..kind~animal}.
% un(FS) --> [cai], {FS=arg1~(kind~table)}.
% un(FS) --> [cuon], {FS=arg1~(kind~book)}.
% un(FS) --> [con], {FS=arg1~(kind~animal)}.
% jj(FS) --> [moi], {FS=arg1~(kind~table)}.
% jj(FS) --> [hay], {FS=arg1~(kind~book)}.
% jj(FS) --> [thong_minh], {FS=arg1~(kind~animal)}.
% np(FS) --> un(UN), nn(NN), {UN=arg1~(kind~Y),NN=sem~N..kind~Y,FS=sem~N..kind~Y}.
% np(FS) --> nn(NN),jj(JJ), {NN=sem~N..kind~Y,JJ=arg1~(kind~Y),FS=sem~N..kind~Y}.

% nn(FS) --> [ban], {FS=sem~'ban'..kind~thing}.
% nn(FS) --> [ly], {FS=sem~'ly'..kind~thing}.
% un(FS) --> [cai], {FS=kind~thing}.
% np(FS) --> un(UN), nn(NN), {UN=kind~Y,NN=sem~N..kind~Y,FS=sem~N..kind~Y}.


% nn(FS) --> [ban], {FS=sem~'ban'..kind~table}.
% nn(FS) --> [sach], {FS=sem~'sach'..kind~book}.
% nn(FS) --> [ket], {FS=sem~'ket'..kind~animal}.
% un(FS) --> [cai], {FS=kind~table}.
% un(FS) --> [cuon], {FS=kind~book}.
% un(FS) --> [con], {FS=kind~animal}.
% jj(FS) --> [moi], {FS=kind~table}.
% jj(FS) --> [hay], {FS=kind~book}.
% jj(FS) --> [thong_minh], {FS=kind~animal}.
% np(FS) --> un(UN), nn(NN), {UN=kind~Y,NN=sem~N..kind~Y,FS=sem~N..kind~Y}.
% np(FS) --> nn(NN),jj(JJ), {NN=sem~N..kind~Y,JJ=kind~Y,FS=sem~N..kind~Y}.


%=====================================

% nn(FS) --> [ket], {FS=sem~'ket'..kind~animal}.
% nn(FS) --> [ban], {FS=sem~'ban'..kind~table}.
% nn(FS) --> [sach], {FS=sem~'sach'..kind~book}.
% un(FS) --> [con], {FS=kind~animal}.
% un(FS) --> [cuon], {FS=kind~book}.
% un(FS) --> [cai], {FS=kind~table}.
% jj(FS) --> [moi], {FS=kind~table}.
% jj(FS) --> [moi], {FS=kind~book}.
% jj(FS) --> [hay], {FS=kind~book}.
% jj(FS) --> [thong_minh], {FS=kind~animal}.
% cd(FS) --> [mot], {FS='mot'}. % OR cd(_) --> [mot].
% np(FS) --> cd(_), un(UN) ,nn(NN), jj(JJ), {UN=kind~Y,NN=sem~N..kind~Y, JJ=kind~Y,FS=sem~N..kind~Y}.
% np(FS) --> un(UN), nn(NN), {UN=kind~Y,NN=sem~N..kind~Y,FS=sem~N..kind~Y}.
% vb(FS) --> [nuoi], {FS=sem~'nuoi'..arg1~(kind~animal)}.
% vb(FS) --> [doc], {FS=sem~'doc'..arg1~(kind~book)}.
% vb(FS) --> [mua], {FS=sem~'mua'..arg1~(kind~table)}.
% vb(FS) --> [mua], {FS=sem~'mua'..arg1~(kind~book)}.
% vb(FS) --> [mua], {FS=sem~'mua'..arg1~(kind~animal)}.
% vp(FS) --> vb(VB),np(NP),{VB=sem~M..arg1~(kind~X),NP=sem~N..kind~X,FS=sem~M..agr1~(sem~N..kind~X)}.

%=====================================

% Nam mua mot con ket moi
% nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
% nn(FS) --> [ket], {FS=sem~'ket'..kind~animal}.
% nn(FS) --> [ban], {FS=sem~'ban'..kind~table}.
% nn(FS) --> [sach], {FS=sem~'sach'..kind~book}.
% un(FS) --> [con], {FS=kind~animal}.
% un(FS) --> [cuon], {FS=kind~book}.
% un(FS) --> [cai], {FS=kind~table}.
% jj(FS) --> [moi], {FS=kind~table}.
% jj(FS) --> [moi], {FS=kind~book}.
% jj(FS) --> [hay], {FS=kind~book}.
% jj(FS) --> [thong_minh], {FS=kind~animal}.
% cd(FS) --> [mot], {FS='mot'}.
% np(FS) --> cd(_), un(UN) ,nn(NN), jj(JJ), {UN=kind~Y,NN=sem~N..kind~Y, JJ=kind~Y,FS=sem~N..kind~Y}.
% np(FS) --> nnp(FS).
% vb(FS) --> [nuoi], {FS=sem~'nuoi'..arg1~(kind~human)..arg2~(kind~animal)}.
% vb(FS) --> [doc], {FS=sem~'doc'..arg1~(kind~human)..arg2~(kind~book)}.
% vb(FS) --> [mua], {FS=sem~'mua'..arg1~(kind~human)..arg2~(kind~table)}.
% vp(FS) --> vb(VB),np(NP),{VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)}.
% s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X,VP=sem~N..arg1~(kind~X)..arg2~(sem~Z..kind~Y),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~Z..kind~Y)}.

%=====================================

% nam quen lan o truong 
% lan doc sach o thu_vien
% advp(X,Y,[]) liệt kê ra rồi ràng buộc lại cho đỡ sai 

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
s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X,VP=sem~N..arg1~(kind~X)..arg2~(sem~Z..kind~Y)..arg3~(sem~L..kind~H),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~Z..kind~Y)..arg3~(sem~L..kind~H)}.

