%% Lee�˲���
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
im_ret = Lee( im, 9, 'same', 10, 'symmetric', 1);
im_ret = uint8(im_ret);
subplot(122),imshow(im_ret,[]);title('Lee�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����


