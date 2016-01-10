%% RGB --> LAB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2lab(im);    % RGB转化为LAB
subplot(122),imshow(im1,[]);title('LAB')

figure('color',[1,1,1])
imshow(im1,[]);title('LAB')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('LAB')
subplot(222),imshow(im1(:,:,1),[]);title('L')
subplot(223),imshow(im1(:,:,2),[]);title('A')
subplot(224),imshow(im1(:,:,3),[]);title('B')

%% LAB -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2lab(im);    % RGB转化为LAB
figure('color',[1,1,1])
subplot(121),imshow(im1,[]);title('LAB')
im2 = lab2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')