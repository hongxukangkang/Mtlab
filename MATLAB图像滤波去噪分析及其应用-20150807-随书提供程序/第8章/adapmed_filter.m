% ����Ӧ��ֵ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.jpg';},'ѡ��ͼƬ'); % ѡ��ͼƬ·��
str = [pathname filename];     % �ϳ�·��+�ļ���
im = imread(str);              % ԭͼ��
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

im1 = adapmedian_filter( im,3 );  % Ӧ������Ӧ��ֵ�˲�
figure('color',[1,1,1])
subplot(121),imshow(im,[]),title('original image')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im1,[]),title('����Ӧ��ֵ�˲�')
colormap(jet)  % ��ɫ
shading interp % ����
