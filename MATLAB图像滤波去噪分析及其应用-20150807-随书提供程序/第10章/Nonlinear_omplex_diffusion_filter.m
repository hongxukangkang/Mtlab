%�������Ը���ɢ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

%�����Ը���ɢ�˲���������
TMAX = 0.80;   % ��ɢʱ�� 
[im_e, nIter, dTT] = NCD_filter(im, TMAX);  % �����Ը���ɢ�˲�


figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im_e,[]);title('�����Ը���ɢ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
toc
