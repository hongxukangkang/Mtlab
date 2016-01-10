clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
figure('color',[1,1,1])
imshow(im,[])
R = im(:,:,1);  % R
G = im(:,:,2);  % G
B = im(:,:,3);  % B
gray_im = rgb2gray(im); % »Ò¶È»¯
figure('color',[1,1,1])
subplot(221),imshow(im,[]);title('RGB')
subplot(222),imshow(gray_im,[]);title('»Ò¶ÈÍ¼Ïñ')
subplot(234),imshow(R,[]);title('R')
subplot(235),imshow(G,[]);title('G')
subplot(236),imshow(B,[]);title('B')





