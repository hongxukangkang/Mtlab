%����̬ѧ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

% ��̬ѧ�˲�
sca = 5;                           % �ṹԪ�سߴ�
im_e = morphology_filter(im,sca);  % ��̬ѧ�˲�

figure('color',[1,1,1]),
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im_e,[]);title('��̬ѧ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
toc



