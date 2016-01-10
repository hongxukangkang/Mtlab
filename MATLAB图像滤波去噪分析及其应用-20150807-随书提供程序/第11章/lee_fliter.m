%% Lee滤波器
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
im_ret = Lee( im, 9, 'same', 10, 'symmetric', 1);
im_ret = uint8(im_ret);
subplot(122),imshow(im_ret,[]);title('Lee滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐


