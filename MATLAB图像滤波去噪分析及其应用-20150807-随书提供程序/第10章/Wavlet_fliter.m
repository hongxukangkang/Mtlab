%% С��ȥ��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

[thr,sorh,keepapp] = ddencmp_thr('den','wv',im);  
% ��gb1����ʾʹ��ȫ�����޽���ȥ��
% 'sym4'С���任����
N = 4; % С���任�ĳ߶�
im1 = wdencmp('gbl',im,'sym4',N,thr,sorh,keepapp);  % С���˲�

figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im1,[]);title('С���˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����

%% С����ȥ��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
im = imread('brain.bmp');        % ��ͼ
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������
[thr,sorh,keepapp] = ddencmp_thr('den','wp',im);  
im1 = wpdencmp(im,sorh,4,'sym4','threshold',thr,keepapp);
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(im1,[]);title('С�����˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����


