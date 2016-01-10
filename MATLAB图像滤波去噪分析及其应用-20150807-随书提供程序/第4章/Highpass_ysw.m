clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
D0 = 4; % ��ֹ��Ƶ�ʵ���Ƶ�����ĵľ���
n = 2;  % �״�
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������
R1 = freqfilter_btw_Hp(R,D0,n);     % ������˹��ͨ�˲���
G1 = freqfilter_btw_Hp(G,D0,n);     % ������˹��ͨ�˲���
B1 = freqfilter_btw_Hp(B,D0,n);     % ������˹��ͨ�˲���
im1 = cat(3,R1,G1,B1);
im1 = uint8(im1);
figure('color',[1,1,1])
subplot(121),imshow(im,[]); title('ԭʼͼ��')
subplot(122),imshow(im1,[]); title('������˹��ͨ�˲�ͼ��');



