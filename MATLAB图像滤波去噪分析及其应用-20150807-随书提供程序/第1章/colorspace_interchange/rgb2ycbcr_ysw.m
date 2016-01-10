%% RGB --> YCbCr
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2ycbcr(im);    % RGB转化为YCbCr
subplot(122),imshow(im1,[]);title('YCbCr')

%% YCbCr -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2ycbcr(im);    % RGB转化为YCbCr
figure('color',[1,1,1])
subplot(121),imshow(im1,[]);title('YCbCr')
im2 = ycbcr2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')



