% Exercise warm up 
% compare(X, Y) :- X > Y, write('bigger').
% compare(X, Y) :- X < Y, write('smaller').
% compare(X, Y) :- X =:= Y, write('equal').

% # 3 cái này là mệnh đề 
%# rồi query để kiểm chứng compare(1, 2)
% X/john equal X = john

%# Exercise
%# John likes coffee
%# Tony likes tea
%# Paul likes coffee
%# Likes share same interest

%# 3 facts 1 rule

% Cách này ngu 
% coffee(john).
% coffee(paul).
% tea(tony).

% likes(X, Y) :- coffee(X), coffee(Y), write('Same interests').
% likes(X, Y) :- tea(X), tea(Y), write('Same interests').
% likes(X, Y) :- tea(X), coffee(Y), write('irrelevant').
% likes(X, Y) :- coffee(X), tea(Y), write('irrelevant').

likes(john, coffee).
likes(tony, tea).
likes(paul, coffee).
% likes(X, Y) :- likes(X, A), likes(Y, A). viết như thế này bị recursion
friend(X, Y) :- likes(X, A), likes(Y, A), X \= Y.
% friend(X, Y). // type query like this for find varible, use this can apply ';' find next 



