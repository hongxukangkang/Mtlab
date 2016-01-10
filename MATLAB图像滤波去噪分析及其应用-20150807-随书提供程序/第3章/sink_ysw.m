clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
D0 = 4; % ��ֹ��Ƶ�ʵ���Ƶ�����ĵľ���
u0 = 50;
v0 = 3;
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������
H = freqfilter_ideal_sink(2*size(R,1),2*size(R,2),u0,v0,D0);     % �����ݲ��˲���
R1 = fftfilt2(R,H); % Ƶ���˲�
G1 = fftfilt2(G,H); % Ƶ���˲�
B1 = fftfilt2(B,H); % Ƶ���˲�
im1 = cat(3,R1,G1,B1);
im1 = uint8(im1);
figure('color',[1,1,1])
subplot(121),imshow(im,[]); title('ԭʼͼ��')
subplot(122),imshow(im1,[]); title('�����ݲ��˲�ͼ��');
