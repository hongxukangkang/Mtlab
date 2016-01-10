clc,clear,close all
warning off
feature jit off
im = imread('coloredChips.png');
Z1 = imnoise_poission(im,size(im,1),size(im,2),0.3);
Z1 = im2uint8(Z1);   % ����ת��
figure('color',[1,1,1]),
im(:,:,1) = im(:,:,1) + Z1;  % R
im(:,:,2) = im(:,:,2) + Z1;  % G
im(:,:,3) = im(:,:,3) + Z1;  % B
subplot(121); imshow(im);title('�Ӳ��ɷֲ�����ͼ��')
subplot(122); imhist(Z1); title('�Ӳ��ɷֲ�����ͼ��ֱ��ͼ')


