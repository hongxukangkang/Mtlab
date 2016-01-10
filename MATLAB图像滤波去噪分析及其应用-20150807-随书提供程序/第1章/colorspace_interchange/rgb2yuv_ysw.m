%% RGB --> YUV
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2yuv(im);    % RGB转化为YUV
subplot(122),imshow(im1,[]);title('YUV')

figure('color',[1,1,1])
imshow(im1,[]);title('YUV')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('YUV')
subplot(222),imshow(im1(:,:,1),[]);title('Y')
subplot(223),imshow(im1(:,:,2),[]);title('U')
subplot(224),imshow(im1(:,:,3),[]);title('V')

%% YUV -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2yuv(im);    % RGB转化为YUV
figure('color',[1,1,1])
subplot(121),imshow(im1,[]);title('YUV')
im2 = yuv2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')


