%% Gabor滤波器
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
Sx = 0.5;  % x方向的差异系数
Sy = 0.5;  % y方向的差异系数
U = 1.0;   % x方向的中心频率 
V = 1.0;   % y方向的中心频率 
[G,gabout] = gabor_filter(im,Sx,Sy,U,V);
subplot(122),imshow(gabout);title('Gabor滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐


