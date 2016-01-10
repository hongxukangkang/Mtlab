clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
Z1 = imnoise(im(:,:,1),'gaussian',0,0.01);
im(:,:,1) = im(:,:,1) + Z1;  % R
im(:,:,2) = im(:,:,2) + Z1;  % G
im(:,:,3) = im(:,:,3) + Z1;  % B
figure('color',[1,1,1]),
subplot(121); imshow(im);title('�Ӹ�˹����̬������ͼ��')
subplot(122); imhist(Z1); title('�Ӹ�˹����̬������ͼ��ֱ��ͼ')
