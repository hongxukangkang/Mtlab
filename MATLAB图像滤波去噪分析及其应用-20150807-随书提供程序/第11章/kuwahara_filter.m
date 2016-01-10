%% kuwahara_filter�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
% ת��Ϊ�Ҷ�ͼ��
if size(im,3)==1
    im = im;
else
    im = rgb2gray(im);
end
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
im1 = kuwahara(im,5);
subplot(122),imshow(im1);title('kuwahara�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
