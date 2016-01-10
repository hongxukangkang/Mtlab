%% 六抽头滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

filter_coef = [1 -5 20 20 -5 1]/32;  %(6-tap filter)系数
im_inter = six_tap_filter(im, filter_coef); % 六抽头滤波

figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im_inter,[]);title('六抽头滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐



