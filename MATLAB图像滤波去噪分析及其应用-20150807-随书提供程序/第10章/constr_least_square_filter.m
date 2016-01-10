%　约束最小平方滤波
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'选择图片'); %选择图片路径
str=[pathname filename]; % 合成路径+文件名
im = imread(str);        % 读图
noise_mean = 0;  % 均值
noise_var =1e-3; % 方差
im = imnoise(im,'gaussian',noise_mean, noise_var); % 原图像 + 白噪声

% 约束最小平方滤波
Xd = im2double(im);
HSIZE = [3 3];   % 模板窗口大小
SIGMA = 0.5;     % 标准差
H = fspecial('gaussian',HSIZE,SIGMA);
noise_power = noise_var * prod(size(Xd));   % prod(size(Xd))=65536;噪声的功率
[Zd, LAGRA] = deconvreg_filter(im,H,noise_power);  % 应用约束最小平方滤波

figure('color',[1,1,1]),
subplot(121),imshow(im);title('原始图像')
colormap(jet)  % 颜色
shading interp % 消隐
subplot(122),imshow(Zd,[]);title('约束最小平方滤波图像')
colormap(jet)  % 颜色
shading interp % 消隐
toc
