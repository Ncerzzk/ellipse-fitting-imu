function x=gaussLinearEquation(A,b)
%��˹�������Է���Ax=b
disp('ԭ����ΪAX=b��')
A
b
disp('------------------------')
n=length(b);
eps=10^-2;
for k=1:n-1
%������Ԫ
[mainElement,index]=max(abs(A(k:n,k)));
index=index+k-1;%index��A(k:n,k)�е��к�ת��Ϊ��A�е��к�
if abs(mainElement)<eps
disp('��Ԫ��̫С����');
break;
elseif index>k
%����Ԫ�����в��ǵ�ǰ�У�����ǰ��������Ԫ�����н���
temp=A(k,:);
A(k,:)=A(index,:);
A(index,:)=temp;
end
%��Ԫ
for i=k+1:n
m(i,k)=A(i,k)/A(k,k);%A(k,k)��A(i,k)��Ϊ0����ϵ��
A(i,k:n)=A(i,k:n)-m(i,k)*A(k,k:n);%��i����Ԫ����
b(i)=b(i)-m(i,k)*b(k);%����bҲ��Ҫ������
end
A
end
disp('��Ԫ�����õ�������������')
%�ش�
b(n)=b(n)/A(n,n);
for i=n-1:-1:1
%sum(A(i,i+1:n).*b(i+1:n)')��ʾ��֪
b(i)=(b(i)-sum(A(i,i+1:n).*b(i+1:n)'))/A(i,i);
end
clear x;
x=A;