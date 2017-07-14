function [ Z ] = ten_com(U,w,alpha,beta,J ,max_iter)
Z=tensor(U);
W_bar=tenones(size(Z));
W_bar(w,7,7,:)=0;
W=tenzeros(size(Z));
W(w,7,7,:)=1;
siz =size(Z);

Y1=rand(J(1),siz(4)*siz(2)*siz(3));
Y2=rand(J(2),siz(4)*siz(1)*siz(3));
Y3=rand(J(3),siz(4)*siz(2)*siz(1));
Y4=rand(J(4),siz(1)*siz(2)*siz(3));
M1=tenmat(Z,1);
M2=tenmat(Z,2);
M3=tenmat(Z,3);
M4=tenmat(Z,4);
%size(pinv(Y1))
%size(M1)
for i=1:max_iter
    A1=M1*pinv(Y1);
    
    A2=M2*pinv(Y2);
    A3=M3*pinv(Y3);
    A4=M4*pinv(Y4);
    
    Y1=pinv(A1.data)*(M1.data);
    Y2=pinv(A2.data)*M2.data;
    Y3=pinv(A3.data)*M3.data;
    Y4=pinv(A4.data)*M4.data;
    Z=Z.*W_bar+(beta(1).*tensor(M1)+beta(2).*tensor(M2)+beta(3).*tensor(M3)+beta(4).*tensor(M4))./(sum(beta)).*W;
    s=(beta(1).*tensor(M1)+beta(2).*tensor(M2)+beta(3).*tensor(M3)+beta(4).*tensor(M4))./(sum(beta));
    %W(7,w,1,1)
    %s(7,w,1,:)
    %: Ti = ((?iAiYi + ?iZ(i))/(?i + ?i)) Mi ?
               % Ti + PW(i)(Z(i) ? Ti).
    M1=tenmat(Z,1);
    M2=tenmat(Z,2);
    M3=tenmat(Z,3);
    M4=tenmat(Z,4);
    %size(alpha(1).*(A1.data)*Y1)
    
    %disp(x.data)
    %disp(beta(1).*(M1.data))
    %size(beta(1).*(M1.data))
    %alpha(1).*(A1.data)*Y1+beta(1).*(M1.data)
    x=(alpha(1).*(A1.data)*Y1);
    T1=tenmat((x+beta(1).*(M1.data))/(alpha(1)+beta(1)),M1.rdims,M1.cdims,M1.tsize);
    M1=T1+tenmat((Z-tensor(T1)).*W_bar,1);
    %M1=tenmat((x.data).*W_bar,M1.rdims,M1.cdims,M1.tsize);
    
    
    
    x=(alpha(2).*(A2.data)*Y2);
    T2=tenmat((x+beta(2).*M2.data)/(alpha(2)+beta(2)),M2.rdims,M2.cdims,M2.tsize);
    M2=T2+tenmat((Z-tensor(T2)).*W_bar,2);
    
    
    x=(alpha(3).*(A3.data)*Y3);
     T3=tenmat((x+beta(3).*M3.data)/(alpha(3)+beta(3)),M3.rdims,M3.cdims,M3.tsize);
      M3=T3+tenmat((Z-tensor(T3)).*W_bar,3);
      
      x=(alpha(4).*(A4.data)*Y4);
     T4=tenmat((x+beta(4).*M4.data)/(alpha(4)+beta(4)),M4.rdims,M4.cdims,M4.tsize);
    M4=T4+tenmat((Z-tensor(T4)).*W_bar,4);
      %if()
      %    break;
      %end
      
end



end

