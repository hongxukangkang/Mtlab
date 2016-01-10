clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
Z1 = imnoise_gaussian(size(im,1),size(im,2),100,25);
Z1 = uint8(Z1);   % 类型转换
figure('color',[1,1,1]),
im(:,:,1) = im(:,:,1) + Z1;  % R
im(:,:,2) = im(:,:,2) + Z1;  % G
im(:,:,3) = im(:,:,3) + Z1;  % B
subplot(121); imshow(im);title('加高斯（正态）噪声图像')
subplot(122); imhist(Z1); title('加高斯（正态）噪声图像直方图')

