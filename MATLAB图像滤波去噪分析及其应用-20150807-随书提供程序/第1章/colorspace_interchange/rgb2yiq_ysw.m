%% RGB --> YIQ
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
subplot(121),imshow(im,[]);title('RGB')
im1 = rgb2yiq(im);    % RGB转化为YIQ
subplot(122),imshow(im1,[]);title('YIQ')

figure('color',[1,1,1])
imshow(im1,[]);title('YIQ')
figure('color',[1,1,1])
subplot(221),imshow(im1,[]);title('YIQ')
subplot(222),imshow(im1(:,:,1),[]);title('Y')
subplot(223),imshow(im1(:,:,2),[]);title('I')
subplot(224),imshow(im1(:,:,3),[]);title('Q')
%% YIQ -->  RGB
clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
im1 = rgb2yiq(im);    % RGB转化为YIQ
figure('color',[1,1,1])
subplot(121),imshow(im1,[]);title('YIQ')
im2 = yiq2rgb(im1);
subplot(122),imshow(im2,[]);title('RGB')


