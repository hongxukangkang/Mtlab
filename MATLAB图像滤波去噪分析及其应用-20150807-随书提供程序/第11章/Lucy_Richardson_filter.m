%% Lucy_Richardson滤波器
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = im(40:250,40:220);  % 截取部分分析，考虑背景像素0（黑色）的影响
% 转化为灰度图像
if size(im,3)==1
    im = im;
else
    im = rgb2gray(im);
end
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
im1 = Lucy_Richardson(im, 5, 10, 50);
subplot(122),imshow(uint8(im1));title('Lucy_Richardson滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐




