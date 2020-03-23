% nam an com
% nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
% nn(FS) --> [com], {FS=sem~'com'..kind~food}.
% vb(FS) --> [an], {FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)}.
% np(FS) --> nnp(FS).
% np(FS) --> nn(FS).
% vp(FS) --> vb(VB), np(NP), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)}.
% s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X,VP=sem~N..arg1~(kind~X)..arg2~(sem~K..kind~Y),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~K..kind~Y)}.


% ==========
% FS = sem~an..arg1~(sem~Nam..kind~human)..arg2~(sem~com..kind~food)
% % FS = sem~an..arg1~(sem~Nam..kind~human)..arg2~(sem~com..kind~food)..arg3~(sem~o..arg1(sem~nha..kind~house))

% VP=sem~N..arg1~(kind~X)..arg2~(sem~K..kind~Y)
% FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)

% VB=sem~M..arg1~(kind~X)..arg2~(kind~Y)
% FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)
% debug vp
% vp(FS,[an,com],[]).

% ==========

% https://stackoverflow.com/a/50524977

% [VERSION 1] nam an com o nha 
% nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
% nn(FS) --> [com], {FS=sem~'com'..kind~food}.
% nn(FS) --> [nha], {FS=sem~'nha'..kind~house}.
% vb(FS) --> [an], {FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)}.
% np(FS) --> nnp(FS).
% np(FS) --> nn(FS).
% pp2(FS) --> [o], {FS=sem~'o'..arg1~(kind~house)}.
% vp(FS) --> vb(VB), np(NP), pp2(PP), np(NP1), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,PP=sem~L..arg1~(kind~H),NP1=sem~Z..kind~H,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H))}.

% s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X, VP=sem~N..arg1~(kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H)),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H))}.

%version 2
nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
nn(FS) --> [com], {FS=sem~'com'..kind~food}.
nn(FS) --> [nha], {FS=sem~'nha'..kind~house}.
vb(FS) --> [an], {FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)..arg3~(kind~place)}.
np(FS) --> nnp(FS).
np(FS) --> nn(FS).
pp2(FS) --> [o], {FS=sem~'o'..kind~place..arg1~(kind~house)}.
vp(FS) --> vb(VB), np(NP), pp2(PP), np(NP1), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y)..agr3~(kind~V),NP=sem~N..kind~Y,PP=sem~L..kind~V..arg1~(kind~H),NP1=sem~Z..kind~H,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H))}.

s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X, VP=sem~N..arg1~(kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H)),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H))}.

% ==============


% nnp(FS) --> [nam], {FS=sem~'Nam'..kind~human}.
% nn(FS) --> [com], {FS=sem~'com'..kind~food}.
% nn(FS) --> [nha], {FS=sem~'nha'..kind~house}.


% % vb(FS) --> [an], {FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)..arg3~(kind~position)}.
% vb(FS) --> [an], {FS=sem~'an'..arg1~(kind~human)..arg2~(kind~food)}.



% % pp(FS) --> [o], {FS=sem~'o'..kind~position}.
% np(FS) --> nnp(FS).
% np(FS) --> nn(FS).

% pp2(FS) --> [o], {FS=sem~'o'..arg1~(kind~house)}.
% % lam(FS) --> pp2(PP), np(NP), {PP=sem~M..arg1~(kind~X),NP=sem~N..kind~X,FS=sem~M..arg1~(sem~N..kind~X)}.

% vp(FS) --> vb(VB), np(NP), pp2(PP), np(NP1), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,PP=sem~L..arg1~(kind~H),NP1=sem~Z..kind~H,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..arg1~(sem~Z..kind~H))}.

% % vp(FS) --> vb(VB), np(NP), pp2(PP), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y),NP=sem~N..kind~Y,PP=sem~L..arg1(kind~H),FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)}.


% % vp(FS) --> vb(VB), np(NP), pp(PP), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y)..arg3~(kind~Z),NP=sem~N..kind~Y,PP=sem~L..kind~Z,FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..kind~Z)}.



% s(FS) --> np(NP), vp(VP), {NP=sem~M..kind~X, VP=sem~N..arg1~(kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..kind~Z..arg1~(kind~H)),FS=sem~N..arg1~(sem~M..kind~X)..arg2~(sem~K..kind~Y)..arg3~(sem~L..kind~Z..arg1~(kind~H))}.

% ==========

% ntn moi dung 
% FS = sem~an..arg1~(sem~Nam..kind~human)..arg2~(sem~com..kind~food)..arg3~(sem~o..arg1(sem~nha..kind~house))


% pp(FS) --> [o], {FS=sem~'o'..kind~position..arg1~(kind~house)}.

% vp(FS) --> vb(VB), np(NP), pp(PP), {VB=sem~M..arg1~(kind~X)..arg2~(kind~Y)..arg3~(kind~Z),NP=sem~N..kind~Y,PP=sem~L..kind~Z..arg1~(kind~H),FS=sem~M..arg1~(kind~X)..arg2~(sem~N..kind~Y)..arg3~(sem~L..kind~Z..arg1~(kind~H))}.
