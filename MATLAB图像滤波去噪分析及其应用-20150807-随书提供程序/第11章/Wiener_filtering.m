%% Wiener�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

SNR = 0.0001;   % �����
resim = Wiener(im, 1.2, 30,SNR);       % ���˲�
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(resim,[]);title('Wiener�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����


