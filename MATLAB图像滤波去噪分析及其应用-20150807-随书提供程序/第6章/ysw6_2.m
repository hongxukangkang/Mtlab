clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('coloredChips.png');           % 原图像
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + 白噪声
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + 白噪声
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + 白噪声
im = cat(3,R,G,B);                         % 原图像 + 白噪声

h1 = fspecial('average');
h2 = fspecial('average',[5,5]);
h3 = fspecial('disk',5);

R1 = filter2(h1,R); 
G1 = filter2(h1,G); 
B1 = filter2(h1,B); 
im1 = cat(3,R1,G1,B1);  % 3x3均值滤波

R2 = filter2(h2,R);
G2 = filter2(h2,G);
B2 = filter2(h2,B);
im2 = cat(3,R2,G2,B2);  % 5x5均值滤波

R3 = filter2(h3,R);
G3 = filter2(h3,G);
B3 = filter2(h3,B);
im3 = cat(3,R3,G3,B3);  % 半径为5的圆盘滤波

figure('color',[1,1,1])
subplot(221),imshow(im,[]),title('加白噪声的图像')
subplot(222),imshow(uint8(im1),[]),title('3x3均值滤波')
subplot(223),imshow(uint8(im2),[]),title('5x5均值滤波')
subplot(224),imshow(uint8(im3),[]),title('圆盘滤波')
