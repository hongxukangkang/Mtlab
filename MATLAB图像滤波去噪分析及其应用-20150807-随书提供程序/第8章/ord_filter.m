% �����˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('brain.bmp');             % ԭͼ��
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

im1 = ordfilt2(im, 1, true(5));  % Ӧ�������˲�
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im1,[]),title('�����˲�')
colormap(jet)  % ��ɫ
shading interp % ����


