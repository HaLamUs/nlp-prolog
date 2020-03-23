% % Nam hoc bai 
% nnp(nam) --> [nam].
% nn(X^bai(X)) --> [bai].
% np(X) --> det(Y^X),nn(Y).
% %np((X^P)^P) --> nnp(X). 
% np(X) --> nnp(X).
% vb(X^Y^hoc(X,Y)) --> [hoc].
% vp(X^VP) --> vb(X^VB), np(VB^VP).
% :-op(500, xfy, &).
% :-op(600,xfy,=>).
% det((X^P)^(X^Q)^exist(X,P&Q)) --> [mot].
% det((X^P)^(X^Q)^every(X,P=>Q)) --> [moi].
% s(Y) --> np(X), vp(X^Y).



% Nam hoc bai 
% nnp(nam) --> [nam].
% nn(X^bai(X)) --> [bai].
% np(X) --> det(Y^X),nn(Y).
% np((X^P)^P) --> nnp(X). 
% vb(X^Y^hoc(X,Y)) --> [hoc].
% vp(X^VP) --> vb(X^VB), np(VB^VP).
% :-op(500, xfy, &).
% :-op(600,xfy,=>).
% det((X^P)^(X^Q)^exist(X,P&Q)) --> [mot].
% det((X^P)^(X^Q)^every(X,P=>Q)) --> [moi].
% s(X) --> np(Y^X), vp(Y). 


% Nam quen moi nguoi 
% moi nguoi quen Nam
% nnp(nam) --> [nam].
% nn(X^nguoi(X)) --> [nguoi].
% np(X) --> det(Y^X),nn(Y).
% np((X^P)^P) --> nnp(X). 
% vb(X^Y^quen(X,Y)) --> [quen].
% vp(X^VP) --> vb(X^VB), np(VB^VP).
% :-op(500, xfy, &).
% :-op(600,xfy,=>).
% det((X^P)^(X^Q)^exist(X,P&Q)) --> [mot].
% det((X^P)^(X^Q)^every(X,P=>Q)) --> [moi].
% s(X) --> np(Y^X), vp(Y). 

% mot nguoi quen nam 
% nnp(nam) --> [nam].
% nn(X^nguoi(X)) --> [nguoi].
% np(X) --> det(Y^X),nn(Y).
% np((X^P)^P) --> nnp(X). 
% vb(X^Y^quen(X,Y)) --> [quen].
% vp(X^VP) --> vb(X^VB), np(VB^VP).
% :-op(500, xfy, &).
% :-op(600,xfy,=>).
% det((X^P)^(X^Q)^exist(X,P&Q)) --> [mot].
% det((X^P)^(X^Q)^every(X,P=>Q)) --> [moi].
% s(X) --> np(Y^X), vp(Y). 


% nam quen lan 
% nnp(nam) --> [nam].
% nnp(lan) --> [lan].
% np((X^P)^P) --> nnp(X). 
% vb(X^Y^quen(X,Y)) --> [quen].
% vp(X^VP) --> vb(X^VB), np(VB^VP).
% s(X) --> np(Y^X), vp(Y). 


nn(lambda(X,bai(X))) --> [bai].
nnp(lambda(P, P@nam)) --> [nam].
vb(lambda(X, lambda(Y,X@lambda(Z,hoc(Y,Z))))) --> [hoc].
det(lambda(P,lambda(Q,exist(X,(P@X)&(Q@X))))) --> [mot].
det(lambda(P,lambda(Q,every(X,(P@X)=>(Q@X))))) --> [moi].
np(X) --> nnp(X).
np(Det@Noun) --> det(Det), nn(Noun).
vp(VB@NP) --> vb(VB), np(NP).
vp(X) --> vb(X).
s(NP@VP) --> np(NP), vp(VP).
:-op(700,yfx,@). 