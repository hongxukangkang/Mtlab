clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('coloredChips.png');           % 原图像
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + 白噪声
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + 白噪声
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + 白噪声
im = cat(3,R,G,B);                         % 原图像 + 白噪声

h1 = fspecial('average')
h2 = fspecial('average',5)

Y1 = filter2(h1,R);  
Y2 = filter2(h2,R);
Y3 = filter2(h2,R,'full');
Y4 = filter2(h2,R,'same');
Y5 = filter2(h2,R,'valid');
figure('color',[1,1,1])
subplot(231),imshow(R,[]),title('original image')
subplot(232),imshow(Y1,[]),title('Y = filter2(B,X)')
subplot(233),imshow(Y2,[]),title('Y = filter2(B,X)')
subplot(234),imshow(Y3,[]),title('Y = filter2(B,X,‘full’)')
subplot(235),imshow(Y3,[]),title('Y = filter2(B,X,‘same’)')
subplot(236),imshow(Y3,[]),title('Y = filter2(B,X,‘valid’)')



