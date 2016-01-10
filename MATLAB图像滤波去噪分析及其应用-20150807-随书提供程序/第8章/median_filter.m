% 中值滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.jpg';},'选择图片'); % 选择图片路径
str = [pathname filename];     % 合成路径+文件名
im = imread(str);              % 原图像
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

im1 = med_filt2(im, 3 );  % 应用中值滤波
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im1,[]),title('中值滤波')
colormap(jet)  % 颜色
shading interp % 消隐


