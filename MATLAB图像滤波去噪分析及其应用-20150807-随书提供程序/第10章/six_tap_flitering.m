%% ����ͷ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

filter_coef = [1 -5 20 20 -5 1]/32;  %(6-tap filter)ϵ��
im_inter = six_tap_filter(im, filter_coef); % ����ͷ�˲�

figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im_inter,[]);title('����ͷ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����



