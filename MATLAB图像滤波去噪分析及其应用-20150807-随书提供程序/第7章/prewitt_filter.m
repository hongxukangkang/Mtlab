% prewitt���˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������

h = prewitt_fspecial('prewitt');  % Ӧ��prewitt������ͼ��
R1 = filter2(h,R);          % prewitt�����˲���
G1 = filter2(h,G);          % prewitt�����˲���
B1 = filter2(h,B);          % prewitt�����˲���
im1 = cat(3,R1,G1,B1);      % prewitt�����˲���ͼ��
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
subplot(122),imshow(im1,[]),title('prewitt���˲���')