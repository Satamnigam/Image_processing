t1=-1:0.01:0;
t2=0:0.01:1;
t3=1:0.01:2;
t=[t1 t2 t3];
x1=zeros(size(t1));
x2=ones(size(t2));
x3=zeros(size(t3));
x=[x1 x2 x3];
a=fft2(x,[],256)
figure(1);
plot(t,a);

t4=2:0.01:3;
t5=3:0.01:4;
t6=4:0.01:5;
t7=[t4 t5 t6];
x4=zeros(size(t4));
x5=ones(size(t5));
x6=zeros(size(t6));
y=[x4 x5 x6];
b=fft2(y);
figure(2);
plot(t7,b);
z=conv(x,y);;
figure(3);
plot(z);

j=conv(a,b)
figure(4);
plot(j);