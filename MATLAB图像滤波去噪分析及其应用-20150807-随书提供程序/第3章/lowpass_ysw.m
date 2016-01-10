clc,clear,close all
warning off
feature jit off
D0 = 2; % ��ֹ��Ƶ�ʵ���Ƶ�����ĵľ���
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������
R1 = freqfilter_ideal_lp(R,D0);     % �����ͨ�˲���
G1 = freqfilter_ideal_lp(G,D0);     % �����ͨ�˲���
B1 = freqfilter_ideal_lp(B,D0);     % �����ͨ�˲���
im1 = cat(3,R1,G1,B1);
figure('color',[1,1,1])
subplot(121),imshow(im,[]); title('ԭʼͼ��')
subplot(122),imshow(im1,[]); title('�����ͨ�˲�ͼ��');



