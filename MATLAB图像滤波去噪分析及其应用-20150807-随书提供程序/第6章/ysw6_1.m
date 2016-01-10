clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('coloredChips.png');           % ԭͼ��
R = imnoise(im(:,:,1),'gaussian',0,0.01);  % R + ������
G = imnoise(im(:,:,2),'gaussian',0,0.01);  % G + ������
B = imnoise(im(:,:,3),'gaussian',0,0.01);  % B + ������
im = cat(3,R,G,B);                         % ԭͼ�� + ������

h1 = fspecial('average')
h2 = fspecial('average',5)

Y1 = filter2(h1,R);  
Y2 = filter2(h2,R);
Y3 = filter2(h2,R,'full');
Y4 = filter2(h2,R,'same');
Y5 = filter2(h2,R,'valid');
figure('color',[1,1,1])
subplot(231),imshow(R,[]),title('original image')
subplot(232),imshow(Y1,[]),title('Y = filter2(B,X)')
subplot(233),imshow(Y2,[]),title('Y = filter2(B,X)')
subplot(234),imshow(Y3,[]),title('Y = filter2(B,X,��full��)')
subplot(235),imshow(Y3,[]),title('Y = filter2(B,X,��same��)')
subplot(236),imshow(Y3,[]),title('Y = filter2(B,X,��valid��)')



