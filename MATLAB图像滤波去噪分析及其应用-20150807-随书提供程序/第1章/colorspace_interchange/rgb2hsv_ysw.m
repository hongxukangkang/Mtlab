%% RGB --> HSV
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2hsv(im);    % RGB转化为HSV
subplot(122),imshow(im1,[]);title('HSV')

figure('color',[1,1,1])
imshow(im1,[]);title('HSV')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('HSV')
subplot(222),imshow(im1(:,:,1),[]);title('H')
subplot(223),imshow(im1(:,:,2),[]);title('S')
subplot(224),imshow(im1(:,:,3),[]);title('V')
%% HSV --> RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
im1 = rgb2hsv(im);    % RGB转化为HSV
subplot(121),imshow(im1,[]);title('HSV')
im2 = hsv2rgb(im1);    % HSV转化为RGB
subplot(122),imshow(im2,[]);title('RGB')



