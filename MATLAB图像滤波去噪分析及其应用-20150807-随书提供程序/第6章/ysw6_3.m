clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('coloredChips.png');           % 原图像
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + 白噪声
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + 白噪声
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + 白噪声
im = cat(3,R,G,B);                         % 原图像 + 白噪声

filter_coef = [1 1]/2 ;  % (Bilinear Filter)
im_inter = Bilinear_Filter_interp(im, filter_coef);
figure('color',[1,1,1])
subplot(121),imshow(im);title('原始图像')
subplot(122),imshow(im_inter);title('双线性滤波插值图像')







