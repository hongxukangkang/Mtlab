% 给图像加椒噪声
function Z = imnoise_pepper(X,a)
% input：X，输入二维图像矩阵，数据类型为uint8类型
%          a，椒噪声的浓度
% output: Z : 带有噪声的图像
[m,n] = size(X);
R = rand(m,n);
c = find(R<=a);
Z=X ;
Z(c) = 0;