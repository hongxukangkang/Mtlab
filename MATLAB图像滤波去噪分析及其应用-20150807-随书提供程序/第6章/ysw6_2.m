clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������

h1 = fspecial('average');
h2 = fspecial('average',[5,5]);
h3 = fspecial('disk',5);

R1 = filter2(h1,R); 
G1 = filter2(h1,G); 
B1 = filter2(h1,B); 
im1 = cat(3,R1,G1,B1);  % 3x3��ֵ�˲�

R2 = filter2(h2,R);
G2 = filter2(h2,G);
B2 = filter2(h2,B);
im2 = cat(3,R2,G2,B2);  % 5x5��ֵ�˲�

R3 = filter2(h3,R);
G3 = filter2(h3,G);
B3 = filter2(h3,B);
im3 = cat(3,R3,G3,B3);  % �뾶Ϊ5��Բ���˲�

figure('color',[1,1,1])
subplot(221),imshow(im,[]),title('�Ӱ�������ͼ��')
subplot(222),imshow(uint8(im1),[]),title('3x3��ֵ�˲�')
subplot(223),imshow(uint8(im2),[]),title('5x5��ֵ�˲�')
subplot(224),imshow(uint8(im3),[]),title('Բ���˲�')
