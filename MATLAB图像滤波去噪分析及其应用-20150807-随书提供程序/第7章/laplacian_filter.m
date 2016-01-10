% laplacian锐化滤波器
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('coloredChips.png');           % 原图像
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + 白噪声
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + 白噪声
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + 白噪声
im = cat(3,R,G,B);                         % 原图像 + 白噪声

h = laplacian_fspecial('prewitt');  % 应用laplacian算子锐化图像
R1 = filter2(h,R);          % laplacian算子滤波锐化
G1 = filter2(h,G);          % laplacian算子滤波锐化
B1 = filter2(h,B);          % laplacian算子滤波锐化
im1 = cat(3,R1,G1,B1);      % laplacian算子滤波锐化图像
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
subplot(122),imshow(im1,[]),title('laplacian锐化滤波器')
