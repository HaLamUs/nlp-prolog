% male(a).
% male(c, f, g, i).
% female(b, e, d, h).
% father(a, c).
% father(a, d).
% father(c, g).
% father(f, h).
% father(f, i).
% mother(b, c).
% mother(b, d).
% mother(e, g).
% mother(d, h).
% mother(d, i).
% sibling(c, d).
% sibling(h, i).
% cousin(g, h).
% cousin(g, i).

% grandchild(Y, X) :- father(X, Z), father(Z, Y).
% grandchild(Y, X) :- father(X, Z), mother(Z, Y).

% bác là anh/chị của ba mẹ 
father(a, c, d).
mother(b, c).
mother(b, d).
mother(d, h).
mother(d, i).
sibling(c, d).
sibling(h, i).
male(a, c, f, h).
female(b, e, d, g, i).

% find uncle's X
uncle(X, Y) :- sibling(X, Z), mother(Z, Y). 
% query like this uncle(X,i).


