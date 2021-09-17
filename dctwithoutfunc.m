%READ THE IMAGE
I1=imread('cameraman.tif');
I=I1(90:150,140:210);
A=double(I);

%PREALLOCATE THE MATRIX
B=zeros(size(A));
Temp=zeros(size(A));
[M N]=size(A);

x=1:M;
x=repmat(x',1,N);
y=repmat(1:N,M,1);


for i=1:M
    for j = 1: N
   
        if(i==1)
          AlphaP=sqrt(1/M);
        else
          AlphaP=sqrt(2/M);
        end
if(j==1)
          AlphaQ=sqrt(1/N);
        else
          AlphaQ=sqrt(2/N);
        end
  
        cs1=cos((pi*(2*x-1)*(i-1))/(2*M));
        cs2=cos((pi*(2*y-1)*(j-1))/(2*N));
        Temp=A.*cs1.*cs2;
              
      
        B(i,j)=AlphaP*AlphaQ*sum(sum(Temp));
    end
end

%OUTPUT
figure,
subplot(2,1,1);imshow(I1);title('Original Image');
subplot(2,1,2),imshow(log(abs(B)),[]);
colormap(jet);title('After DCT');