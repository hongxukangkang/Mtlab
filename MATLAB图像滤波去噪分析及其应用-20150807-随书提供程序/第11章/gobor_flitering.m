%% Gabor�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
Sx = 0.5;  % x����Ĳ���ϵ��
Sy = 0.5;  % y����Ĳ���ϵ��
U = 1.0;   % x���������Ƶ�� 
V = 1.0;   % y���������Ƶ�� 
[G,gabout] = gabor_filter(im,Sx,Sy,U,V);
subplot(122),imshow(gabout);title('Gabor�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����


