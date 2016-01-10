function im1 = yuv2rgb(im)
% 转化矩阵
T = [0.299,0.587,0.114;
    -0.147,-0.289,0.436;
    0.615,-0.515,-0.100]; % 矩阵系数
Ta = [0;0;0];

TT = inv(T);   % 求逆矩阵
Tb = TT*Ta;

Y = im(:,:,1);  % Y
U = im(:,:,2);  % U
V = im(:,:,3);  % V
% Y = im2double(Y); % 转化为double类型
% U = im2double(U); % 转化为double类型
% V = im2double(V); % 转化为double类型

R = -Tb(1,1) + TT(1,1).* Y + TT(1,2).*U + TT(1,3).*V;
G = -Tb(2,1) + TT(2,1).* Y + TT(2,2).*U + TT(2,3).*V;
B = -Tb(3,1) + TT(3,1).* Y + TT(3,2).*U + TT(3,3).*V;
% R = mat2gray(R); % 灰度值 转化为 0 - 1之间 
% G = mat2gray(G); % 灰度值 转化为 0 - 1之间 
% B = mat2gray(B); % 灰度值 转化为 0 - 1之间 
im1(:,:,1) = R;  
im1(:,:,2) = G;
im1(:,:,3) = B;
% im1 = min(max(im1,0),1);
% im1 = im2uint8(im1);  % 类型转换
