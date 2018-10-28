raw=load('raw.txt');
syms x y z;
x=zeros(size(raw,1),1);
y=zeros(size(raw,1),1);
z=zeros(size(raw,1),1);
x=raw(:,1);
y=raw(:,2);
z=raw(:,3);

A=zeros(6,6);

for i=1:1:size(x,1)
    tempPn={x(i)^2,y(i)^2,z(i)^2,x(i),y(i),z(i)};
    tempPn=cell2mat(tempPn);
    tempPn2=tempPn'*tempPn;
    A=A+tempPn2;
end
B=gaussLinearEquation(A,zeros(6,1))
B
s=null(B)

%s=null(B,'r')
s
a=s(1);b=s(2);c=s(3);d=s(4);e=s(5);f=s(6);
k=4/(d^2/a+e^2/b+f^2/c-4*g);
k=1
kx=sqrt(k*a);
ky=sqrt(k*b);
kz=sqrt(k*c);
xo=-k*d/(2*kx^2);  %前面加-,以及多加了个^2是为了改成 K（x-xo）的误差形式
yo=-k*e/(2*ky^2);
zo=-k*f/(2*kz^2);

sum=0;
for i=1:1:size(x,1)
    sum=x(i)^2+y(i)^2+z(i)^2-1+sum;
end
disp('old:')
sum

sum=0;
for i=1:1:size(x,1)
    sum=((x(i)-xo)*kx)^2+((y(i)-yo)*ky)^2+((z(i)-zo)*kz)^2-1+sum;
    
    %sum=(x(i)*kx+xo)^2+(y(i)*ky+yo)^2+(z(i)*kz+zo)^2-1+sum;
end
disp('new:')
sum
kx
ky
kz
xo
yo
zo

kx2=(max(x)-min(x))/2
xo2=(max(x)+min(x))/2
ky2=(max(y)-min(y))/2
yo2=(max(y)+min(y))/2