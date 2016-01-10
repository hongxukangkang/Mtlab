%　同态滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

%同态滤波参数设置
rL = 0.3999;  % 低频增益
rH = 0.71;   % 高频增益
D0 = 1;   % 截止频率
figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
im_e = Homom_filter(im,D0,rL,rH);   % 同态滤波
subplot(122),imshow(im_e,[]);title('同态滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐
toc




