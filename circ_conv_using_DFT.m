x1= input('Input values of x1');
x2= input('Input values of x2');
m=length(x1);
n=length(x2);
if m>n
    x2=[x2,zeros(1,m-n)];
else if m<n
        
    x1=[x1,zeros(1,n-m)];
    else
    end
end
X1=fft(x1);
X2=fft(x2);
X3=X1.*X2
x3=ifft(X3)
subplot(3,1,1)
stem(x1)
title('X1 sequence')

subplot(3,1,2)
stem(x2)
title('X2 sequence')

subplot(3,1,3)
stem(x3)
title('circular convolution')
p=length(x1);
cconv(x1,x2,p)

