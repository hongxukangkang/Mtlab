%��̬ͬ�˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

%̬ͬ�˲���������
rL = 0.3999;  % ��Ƶ����
rH = 0.71;   % ��Ƶ����
D0 = 1;   % ��ֹƵ��
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
im_e = Homom_filter(im,D0,rL,rH);   % ̬ͬ�˲�
subplot(122),imshow(im_e,[]);title('̬ͬ�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
toc




