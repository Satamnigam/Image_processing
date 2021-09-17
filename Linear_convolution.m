clear all;
x=sin (2*pi*0.1*(1:1:11));
h=[1 2 3 4 5 3 1 -1 ];
% h=input('Enter h:   ') ;
m=length(x);
n=length(h);
X=[x,zeros(1,n-1)]; 
H=[h,zeros(1,m-1)]; 
y=zeros(size(X));
z=zeros(size(X));
for i=1:m+n-1
    for j=1:m+n
        if i-j+1>0
            y(i)=(y(i)+(X(j)*H(i-j+1)));
        end
    end
end
% plot results
figure;
subplot (3,1,1); stem(x, '-b^'); xlabel('n');
ylabel ('x[n]'); grid on;
subplot (3,1,2); stem (h, '-ms');
xlabel ('n'); ylabel('h[n]'); grid on;
subplot (3,1,3); stem (y, '-ro');
ylabel('y[n]'); xlabel ('n'); grid on;
title('Convolution of Two Signals without conv function');

