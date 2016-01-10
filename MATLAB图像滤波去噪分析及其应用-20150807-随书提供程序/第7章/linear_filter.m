% �������˲���
clc,clear,close all  % �������������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������

w =[-1 -1 -1;   % ��Ĥmask
    -1 8 -1;
    -1 -1 -1];
im1 = linear_sharpen_filter(im,w);
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
subplot(122),imshow(im1,[]),title('�������˲���')




