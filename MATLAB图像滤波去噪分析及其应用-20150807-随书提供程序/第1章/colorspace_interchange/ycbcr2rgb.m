function im1 = ycbcr2rgb(im)
% 转化矩阵
T = [65.481,128.553,24.966;
    -37.797,-74.203,112.0;
    112.0,-93.786,-18.214];  % 矩阵系数
Ta = [16;128;128];

TT = inv(T);   % 求逆矩阵
Tb = TT*Ta;

Y = im(:,:,1);   % Y
Cb = im(:,:,2);  % Cb
Cr = im(:,:,3);  % Cr
Y = im2double(Y);   % 转化为double类型
Cb = im2double(Cb); % 转化为double类型
Cr = im2double(Cr); % 转化为double类型

R = -Tb(1,1) + TT(1,1).* Y + TT(1,2).*Cb + TT(1,3).*Cr;
G = -Tb(2,1) + TT(2,1).* Y + TT(2,2).*Cb + TT(2,3).*Cr;
B = -Tb(3,1) + TT(3,1).* Y + TT(3,2).*Cb + TT(3,3).*Cr;
R = mat2gray(R); % 灰度值 转化为 0 - 1之间 
G = mat2gray(G); % 灰度值 转化为 0 - 1之间 
B = mat2gray(B); % 灰度值 转化为 0 - 1之间 
im1(:,:,1) = R;  
im1(:,:,2) = G;
im1(:,:,3) = B;
im1 = im2uint8(im1);  % 类型转换


