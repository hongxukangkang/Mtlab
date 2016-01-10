%% RGB --> HSL
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2hsl(im);    % RGB转化为HSL
subplot(122),imshow(im1,[]);title('HSL')

figure('color',[1,1,1])
imshow(im1,[]);title('HSL')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('HSL')
subplot(222),imshow(im1(:,:,1),[]);title('H')
subplot(223),imshow(im1(:,:,2),[]);title('S')
subplot(224),imshow(im1(:,:,3),[]);title('L')

%% HSL --> RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
im1 = rgb2hsl(im);    % RGB转化为HSL
subplot(121),imshow(im1,[]);title('HSL')
im2 = hsl2rgb(im1);    % HSV转化为RGB
subplot(122),imshow(im2,[]);title('RGB')