function x=gaussLinearEquation(A,b)
%高斯法解线性方程Ax=b
disp('原方程为AX=b：')
A
b
disp('------------------------')
n=length(b);
eps=10^-2;
for k=1:n-1
%找列主元
[mainElement,index]=max(abs(A(k:n,k)));
index=index+k-1;%index在A(k:n,k)中的行号转换为在A中的行号
if abs(mainElement)<eps
disp('列元素太小！！');
break;
elseif index>k
%列主元所在行不是当前行，将当前行与列主元所在行交换
temp=A(k,:);
A(k,:)=A(index,:);
A(index,:)=temp;
end
%消元
for i=k+1:n
m(i,k)=A(i,k)/A(k,k);%A(k,k)将A(i,k)消为0所乘系数
A(i,k:n)=A(i,k:n)-m(i,k)*A(k,k:n);%第i行消元处理
b(i)=b(i)-m(i,k)*b(k);%还有b也需要处理！！
end
A
end
disp('消元后所得到的上三角阵是')
%回代
b(n)=b(n)/A(n,n);
for i=n-1:-1:1
%sum(A(i,i+1:n).*b(i+1:n)')表示已知
b(i)=(b(i)-sum(A(i,i+1:n).*b(i+1:n)'))/A(i,i);
end
clear x;
x=A;