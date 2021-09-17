f=imread('D:\Wallpapers\16.jpg');
subplot(3,2,1);

imshow(f);
a=size(f);
disp(a);
title('org=f');
for x=2:449
    for y=2:599
        g(x,y)=-f(x,y+1)-f(x,y-1)-f(x-1,y)-f(x+1,y)+4*f(x,y);
        % g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
    end;
end;
for x=2:449
    for y=2:599
        d(x,y)=f(x,y)+g(x,y);
       % e(x,y)=f(x,y)+t(x,y);
    end;
end;
subplot(3,2,2);

imshow(g);
title('changed=g i.e. edges => higher freq components');
subplot(3,2,3);

imshow(d)
title('f+g i.emodified=org+edges');


