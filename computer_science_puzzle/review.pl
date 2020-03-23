% woman(mia).
% woman(jody).
% woman(yolanda).
% playsAirGuitar(jody).
% party.

% vd 2
% rules head:- body
% fact happy(lam).
% predicate can be defined by fact or rule
% happy(yolanda).
% listens2Music(mia).
% listens2Music(yolanda):- happy(yolanda). % listens(true) if happy (true)
% playsAirGuitar(mia):- listens2Music(mia).
% playsAirGuitar(yolanda):- listens2Music(yolanda). % plays IF listens
% % giờ nếu mày hỏi: playsAirGuitar(mia). thì prolog sẽ trả lời true or false 

% vd 3
% happy(vincent).
% listens2Music(butch).
% playsAirGuitar(vincent):- listens2Music(vincent), happy(vincent). % comma is and &&
% playsAirGuitar(butch):- happy(butch).
% playsAirGuitar(butch):- listens2Music(butch). % cùng 1 head mà define khác nhau hiểu là or ||

% vd 4
% woman(mia).
% woman(jody).
% woman(yolanda).

% loves(vincent, mia). % có 2 biến gọi là relation ship
% loves(marsellus, mia).
% loves(pumpkin, honey_bunny).
% loves(honey_bunny, pumpkin).

% vd 5
% loves(vincent, mia).
% loves(marsellus, mia).
% loves(pumpkin, honey_bunny).
% loves(honey_bunny, pumpkin).
% jealous(X,Y):- loves(X, Z), loves(Y, Z). % đây là 1 cái rules chung chung 

% member(X,[X|T]).
% member(X,[H|T]) :- member(X,T).

% % version 2
% member(X,[X|_]).
% member(X,[_|T]) :- member(X,T).

% vd 6
% nghĩ tới đệ quy 
% http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse15
% a2b([], []).
% a2b([a|Ta], [b|Tb]):- a2b(Ta, Tb).
% 2 cái list này chỉ đúng khi phần tử đầu của list 1 là a, phần tử đầu của list 2 là b VÀ đuôi của nó cũng phải đúng (hay ở chỗ không viết hoa ==> ko phải là biến )
% Trình tự nó chạy như sau
% 0. a2b([a,a,a],[b,b,b]).
% 1. a2b([a,a],[b,b]).
% 2. a2b([a],[b]).
% 3.  a2b([],[]). ==> đến đây nó thấy true vì là fact ==> callback ngc trở lại 
% cái hay ở chỗ mày truyền biến vào, prolog sẽ tìm giá trị của biến đó 
% exp: a2b([a,a,a,a],X). god mode: a2b(X,Y).

% vd 7
%predicate second(X,List) 
%which checks whether X is the second element of List .
% is2(X,[_,X|_]).

% vd 8
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(acht, eight).
tran(neun, nine).
% tran([], []).

listtran([], []).
listtran([H|Y], [X|T]):- tran(H, X), listtran(Y, T).

% listtran([H|_], [tran(H, X)|_]).

% vd 9
% append_list([], L, L).
% append_list([Head|Tail], List2, [Head|List]) :-
%     append_list(Tail, List2, List).
twice([], []).
twice([H|T], [X|Y]) :- X = [H, H], twice(T, Y).