function im1=rgb2hsi(im)

im = double(im)/255;
r = im(:, :, 1);
g = im(:, :, 2);
b = im(:, :, 3);
num=0.5*((r-g)+(r-b));
den=sqrt((r-g).*(r-g))+(r-b).*(g-b);
theta=acos(num./(den+eps));

H = theta;
H(b>g) = 2*pi-H(b>g);
% H = H/(2*pi);

num=min(min(r,g),b);
den=r+g+b;
den(den==0)=eps;
S=1-3.*num./den;
H(S==0)=0;

I=(r+g+b)/3;

im1(:,:,1) = real(H);
im1(:,:,2) = S;
im1(:,:,3) = I;

% im1(:,:,1) = im2uint8(H);
% im1(:,:,2) = im2uint8(S);
% im1(:,:,3) = im2uint8(I);

% im1 =cat(3,H,S,I); 
