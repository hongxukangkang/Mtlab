clc,clear,close all
warning off
feature jit off
D0 = 64; % 阻止的频率点与频域中心的距离
im = imread('coloredChips.png');           % 原图像
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + 白噪声
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + 白噪声
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + 白噪声
im = cat(3,R,G,B);                         % 原图像 + 白噪声
H = freqfilter_ideal_Hp(2*size(R,1),2*size(R,2),D0);     % 理想高通滤波器
R1 = fftfilt2(R,H);
G1 = fftfilt2(G,H);
B1 = fftfilt2(B,H);
im1 = cat(3,R1,G1,B1);
im1 = uint8(im1);
figure('color',[1,1,1])
subplot(121),imshow(im,[]); title('原始图像')
subplot(122),imshow(im1,[]); title('理想高通滤波图像');



