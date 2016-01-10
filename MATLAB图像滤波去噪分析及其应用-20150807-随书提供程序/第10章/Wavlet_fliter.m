%% 小波去噪
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声

[thr,sorh,keepapp] = ddencmp_thr('den','wv',im);  
% ‘gb1’表示使用全局门限进行去噪
% 'sym4'小波变换函数
N = 4; % 小波变换的尺度
im1 = wdencmp('gbl',im,'sym4',N,thr,sorh,keepapp);  % 小波滤波

figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im1,[]);title('小波滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐

%% 小波包去噪
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
im = imread('brain.bmp');        % 读图
im = imnoise(im,'gaussian',0,1e-3); % 原图像 + 白噪声
[thr,sorh,keepapp] = ddencmp_thr('den','wp',im);  
im1 = wpdencmp(im,sorh,4,'sym4','threshold',thr,keepapp);
figure,
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(im1,[]);title('小波包滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐


