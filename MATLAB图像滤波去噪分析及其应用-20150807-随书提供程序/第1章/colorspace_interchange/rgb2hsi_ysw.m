%% RGB --> HSI
clc,clear,close all
warning off
feature jit off
% im = imread('hestain.png');  % 
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2hsi(im);    % RGB转化为HSI
subplot(122),imshow(im1,[]);title('HSI')

figure('color',[1,1,1])
imshow(im1,[]);title('HSI')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('HSI')
subplot(222),imshow(im1(:,:,1),[]);title('H')
subplot(223),imshow(im1(:,:,2),[]);title('S')
subplot(224),imshow(im1(:,:,3),[]);title('I')
%% HSI --> RGB
clc,clear,close all
warning off
feature jit off
im = imread('hestain.png');
figure('color',[1,1,1])
im1 = rgb2hsi(im);     % RGB转化为HSI
subplot(121),imshow(im1,[]);title('HSI')
im2 = hsi2rgb(im1);    % HSV转化为RGB
subplot(122),imshow(im2,[]);title('RGB')
