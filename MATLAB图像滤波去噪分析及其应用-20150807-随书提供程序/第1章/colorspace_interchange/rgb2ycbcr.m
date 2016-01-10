function im1 = rgb2ycbcr(im)
% 转化矩阵
T = [65.481,128.553,24.966;
    -37.797,-74.203,112.0;
    112.0,-93.786,-18.214];  % 矩阵系数
Ta = [16;128;128];

R = im(:,:,1);  % R
G = im(:,:,2);  % G
B = im(:,:,3);  % B
R = im2double(R); % 转化为double类型
G = im2double(G); % 转化为double类型
B = im2double(B); % 转化为double类型

Y = Ta(1,1) + T(1,1).* R + T(1,2).*G + T(1,3).*B;
Cb = Ta(2,1) + T(2,1).* R + T(2,2).*G + T(2,3).*B;
Cr = Ta(3,1) + T(3,1).* R + T(3,2).*G + T(3,3).*B;
im1(:,:,1) = Y;
im1(:,:,2) = Cb;
im1(:,:,3) = Cr;
im1 = uint8(im1);  % 类型转换


