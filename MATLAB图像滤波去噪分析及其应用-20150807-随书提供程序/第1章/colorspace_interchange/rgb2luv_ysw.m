%% RGB --> LUV
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2luv(im);    % RGB转化为LUV
subplot(122),imshow(im1,[]);title('LUV')

figure('color',[1,1,1])
imshow(im1,[]);title('LUV')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('LUV')
subplot(222),imshow(im1(:,:,1),[]);title('L')
subplot(223),imshow(im1(:,:,2),[]);title('U')
subplot(224),imshow(im1(:,:,3),[]);title('V')

%% LUV -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2luv(im);    % RGB转化为LUV
figure('color',[1,1,1])
subplot(121),imshow(im1,[]);title('LUV')
im2 = luv2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')