% г����ֵ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('brain.bmp');           % ԭͼ��
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

im1 = harmonymean_filter(im,3,3);   % Ӧ��г����ֵ�˲�
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im1,[]),title('г����ֵ�˲�')
colormap(jet)  % ��ɫ
shading interp % ����








