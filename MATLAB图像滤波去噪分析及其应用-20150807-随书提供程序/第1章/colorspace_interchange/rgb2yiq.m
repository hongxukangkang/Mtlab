function im1 = rgb2yiq(im)
% 转化矩阵
T = [0.299,0.587,0.114;
    0.595716,-0.274453,-0.321263;
    0.211456,-0.522591,0.311135]; % 矩阵系数
Ta = [0;0;0];

R = im(:,:,1);  % R
G = im(:,:,2);  % G
B = im(:,:,3);  % B
% R = im2double(R); % 转化为double类型
% G = im2double(G); % 转化为double类型
% B = im2double(B); % 转化为double类型
R = double(R)/255; % 转化为double类型
G = double(G)/255; % 转化为double类型
B = double(B)/255; % 转化为double类型

Y = Ta(1,1) + T(1,1).* R + T(1,2).*G + T(1,3).*B;
I = Ta(2,1) + T(2,1).* R + T(2,2).*G + T(2,3).*B;
Q = Ta(3,1) + T(3,1).* R + T(3,2).*G + T(3,3).*B;
im1(:,:,1) = Y;
im1(:,:,2) = I;
im1(:,:,3) = Q;
% im1 = min(max(im1,0),1);
% im1 = im2uint8(im1);  % 类型转换