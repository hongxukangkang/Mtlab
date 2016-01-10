%　形态学滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

% 形态学滤波
sca = 5;                           % 结构元素尺寸
im_e = morphology_filter(im,sca);  % 形态学滤波

figure('color',[1,1,1]),
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im_e,[]);title('形态学滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐
toc



