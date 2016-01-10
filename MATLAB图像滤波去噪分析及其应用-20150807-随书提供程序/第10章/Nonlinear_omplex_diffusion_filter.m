%　非线性复扩散滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

%非线性复扩散滤波参数设置
TMAX = 0.80;   % 扩散时间 
[im_e, nIter, dTT] = NCD_filter(im, TMAX);  % 非线性复扩散滤波


figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im_e,[]);title('非线性复扩散滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐
toc
