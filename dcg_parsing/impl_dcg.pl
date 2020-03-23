
% nhắc lại kiến thức CHỮ HOA LÀ BIẾN 

% http://www.pathwayslms.com/swipltuts/dcg/
% terminals and nonterminals: từ dừng và không 
% https://ongthovuive.wordpress.com/2016/04/22/xu-ly-ngon-ngu-tu-nhien-phan-2/ 

% s --> np, vp. % cái này là cú pháp dcg giống khai báo function 
% np --> nnp.
% np --> nn.
% vp --> vb, np.
% % nnp --> [nam].
% nnp --> [nam]; ['Nam']. % gọi là structure ko truy vấn được 
% nn --> [bai].
% vb --> [hoc].

% Câu 2
% s --> np, vp.
% np --> nnp.
% np --> nn. % dòng này if để sau vp bị warning vì nó muốn những thứ liên quan gần nhau
% vp --> rb, vb, np.
% nnp --> [nam].
% rb --> [dang].
% vb --> [hoc].
% nn --> [toan].


% Truy vấn 
% ?-s([nam, hoc, bai], []).
% ?-vp([hoc, bai], []).
% ?-np([nam], []).
% ?-np([nam], []).
% The VIP way
% ?- np(X,[]).
% nam dang hoc toan 

% để ra đc cái cây cú pháp như DCG thì mình phải mô tả khác
% phải vẽ đc cái cây trc 
nnp(nnp(nam)) --> [nam]; ['Nam']. % nnp bên ngoài là vị từ còn (nnp(nam)) ghi gì cũng đc
nn(nn(bai)) --> [bai].
vb(vb(hoc)) --> [hoc].
np(np(X)) --> nnp(X).
np(np(X)) --> nn(X).
vp(vp(X,Y)) --> vb(X), np(Y).
s(s(X,Y)) --> np(X), vp(Y).


% Yêu cầu 3: Nãy giờ mỗi câu (sentence) chúng ta define 1 văn phạm riêng giờ thử define 1 cái tổng quát dùng chung cho nhiều câu. Phủ đc nhiều dạng câu càng tốt 

%http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse29
% to find out whether a woman shoots a man is a sentence


% cho nó lên trực tiếp là cách khử đệ quy trái (if đổi tên bị mất tính tổng quát)


% ['/Users/lamha/Desktop/codeExtra/prolog_code/impl_dcg.pl'].

% https://en.wikipedia.org/wiki/Definite_clause_grammar
% top-down: chọn left most trc, nếu có 2 định nghĩa NP thì chọn 1 cái nếu sai thì back tracking 
% Trăng nằm sóng soài trên cành liễu 
% trang: NP, Vp:  nằm sóng soài trên cành liễu 
% Định nghĩa văn phạm để phân tích 1 câu theo chiến thuật top down 
% s --> np, vp.
% np --> nn.
% np --> dt, np.
% vp --> vb, adjp, pp.
% adjp --> rb, jj.
% pp --> in, np.
% nn --> [trang].
% nn --> [lieu].
% dt --> [canh].
% vb --> [nam].
% rb --> [song].
% jj --> [soai].
% in --> [tren].

% toi so chieu thu phot nang mo
% s --> np, vp.
% np --> nn.
% np --> dt, np.
% np --> nn, adj.
% np --> np, adjp.
% vp --> vb, np.
% adjp --> rb, np.
% nn --> [toi].
% nn --> [thu].
% nn -->[nang].
% dt --> [chieu].
% adj --> [mo].
% vb --> [so].
% rb --> [phot].










