%%　Non-Local Means滤波器
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = im(60:250,60:200);  % 截取部分分析，考虑背景像素0（黑色）的影响
% 转化为灰度图像
if size(im,3)==1
    im = im;
else
    im = rgb2gray(im);
end
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

D = Non_Local_Means(im,3,3,0.15);  % 应用Non-Local Means滤波图像
figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(D,[]);title('Non-Local Means滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐

