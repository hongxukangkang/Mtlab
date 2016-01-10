% 逆谐波均值滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('brain.bmp');           % 原图像
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

im1 = conharmmean_filter(im,3,3,3/2);   % 应用逆谐波均值滤波
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im1,[]),title('逆谐波均值滤波')
colormap(jet)  % 颜色
shading interp % 消隐

