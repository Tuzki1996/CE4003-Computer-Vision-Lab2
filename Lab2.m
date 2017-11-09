%% 3.1       Edge Detection 
PC3=imread('macritchie.jpg');
P31 = rgb2gray(PC3);
imshow(P31);
verti=[-1,0,1;
       -2,0,2;
       -1,0,1];
hori=[-1,-2,-1;
      0,0,0; 
      1,2,1];
v=conv2(double(P31),double(verti));
h=conv2(double(P31),double(hori));
imshow(uint8(v));
imshow(uint8(h));
Pa=imadd((v.^2),(h.^2));
Pa=sqrt(Pa);
imshow(Pa);


E20 = Pa>20;
imshow(E20);
E60 = Pa>60;
imshow(E60);
E100 = Pa>100;
imshow(E100);
E150 = Pa>150;
imshow(E150);
E300 = Pa>300;
imshow(E300);

tl=0.04;th=0.1;
E1 = edge(P31,'canny',[tl th],1); 
imshow(E1);
E2 = edge(P31,'canny',[tl th],2); 
imshow(E2);
E3 = edge(P31,'canny',[tl th],3); 
imshow(E3);
E4 = edge(P31,'canny',[tl th],4); 
imshow(E4);
E5 = edge(P31,'canny',[tl th],5); 
imshow(E5);
T1 = edge(P31,'canny',[0.01 th],1); 
imshow(T1);
T2 = edge(P31,'canny',[0.02 th],1); 
imshow(T2);
T4 = edge(P31,'canny',[0.04 th],1); 
imshow(T4);
T7 = edge(P31,'canny',[0.07 th],1); 
imshow(T7);
T9 = edge(P31,'canny',[0.09 th],1); 
imshow(T9);
%% 3.2 Line Finding using Hough Transform 
PC32=imread('macritchie.jpg');
PG32 = rgb2gray(PC32);
tl=0.04;th=0.1;
E=edge(PG32,'canny',[tl th],1); 
theta=0:179;
[H, xp] = radon(E); 
imagesc(theta,xp,H);
xlabel('\theta (degrees)');
ylabel('X''');
colormap(hot);
colorbar
[max_value,idx]=max(H(:));
[x_max,y_max]=ind2sub(size(H),idx);
theta=theta(y_max);
radius=xp(x_max);
[A, B] = pol2cart(theta*pi/180, radius);
B = -B; 
C=radius/sin(theta);
[sizey , sizex] = size(E);
center = floor(([sizex sizey] +1 )/2);
xl = - floor((sizex +1) / 2) ;
xr = - xl -1;
yl = (C - (A*xl))/B;
yr = (C - (A*xr))/B;
xshifted = [xl, xr] + center(1)
yshifted = [yl, yr] + center(2)
imshow(PG32);
hold on
line(xshifted,yshifted ,'LineWidth',2,'Color',[1,0,0]);
imshow(E);
line(xshifted,yshifted ,'LineWidth',2,'Color',[1,0,0]);