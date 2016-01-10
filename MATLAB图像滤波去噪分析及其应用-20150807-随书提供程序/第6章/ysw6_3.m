clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������

filter_coef = [1 1]/2 ;  % (Bilinear Filter)
im_inter = Bilinear_Filter_interp(im, filter_coef);
figure('color',[1,1,1])
subplot(121),imshow(im);title('ԭʼͼ��')
subplot(122),imshow(im_inter);title('˫�����˲���ֵͼ��')







