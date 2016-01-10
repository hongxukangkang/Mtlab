%% RGB --> LCH
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2lch(im);    % RGB转化为LCH
subplot(122),imshow(uint8(im1));title('LCH')

figure('color',[1,1,1])
imshow(uint8(im1),[]);title('LCH')
figure('color',[1,1,1])
subplot(221),imshow(uint8(im1),[]);title('LCH')
subplot(222),imshow(im1(:,:,1),[]);title('L')
subplot(223),imshow(im1(:,:,2),[]);title('C')
subplot(224),imshow(im1(:,:,3),[]);title('H')

%% LCH -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2lch(im);    % RGB转化为LCH
figure('color',[1,1,1])
subplot(121),imshow(uint8(im1));title('LCH')
im2 = lch2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')
