%��Լ����Сƽ���˲�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
noise_mean = 0;  % ��ֵ
noise_var =1e-3; % ����
im = imnoise(im,'gaussian',noise_mean, noise_var); % ԭͼ�� + ������

% Լ����Сƽ���˲�
Xd = im2double(im);
HSIZE = [3 3];   % ģ�崰�ڴ�С
SIGMA = 0.5;     % ��׼��
H = fspecial('gaussian',HSIZE,SIGMA);
noise_power = noise_var * prod(size(Xd));   % prod(size(Xd))=65536;�����Ĺ���
[Zd, LAGRA] = deconvreg_filter(im,H,noise_power);  % Ӧ��Լ����Сƽ���˲�

figure('color',[1,1,1]),
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(Zd,[]);title('Լ����Сƽ���˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
toc
