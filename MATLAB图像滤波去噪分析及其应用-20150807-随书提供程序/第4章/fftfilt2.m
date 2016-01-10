function Z = fftfilt2(X,H)
% 频域滤波
% 函数输入：
%       X：输入的空域图像矩阵，double类型
%       H，频域滤波器，一般为图像X的2倍时较好
% 函数输出：
%       Z：输出的空域图像局长呢，数据类型为double类型
 % 二维傅里叶变换
F = fft2(X,size(H,1),size(H,2)); 
% 傅里叶反变换
Z = H.*F; 
Z = ifftshift(Z);
Z = abs(ifft2(Z));
Z = Z(1:size(X,1),1:size(X,2));

