load('data.mat');
U=data;
x_predict=zeros(275,11);
for i=1:5:40

size(U)
max_iter=200;
%for i=1:size(finaltensor,1)
%    figure;
%    plot(finaltensor(i,:,1,1));
%end
s=find(isnan(U));
U(s)=0;
alpha=[1 10 200 1];
beta=[100 100 100 100];
w=14:20;
W=ones(size(U));
W(w,7,7,:)=0;
Z=U.*W;
%Z(7,w,1,1)
J=[2 2 1 3];
X=ten_com(Z,w,alpha,beta,J,max_iter);
x_predict(w-14+i,:)=double(X(w,7,7,:));
find(X<0)
%X(:,7,7,1)
%U(:,7,7,1)
i
U=mor_data(i);
end