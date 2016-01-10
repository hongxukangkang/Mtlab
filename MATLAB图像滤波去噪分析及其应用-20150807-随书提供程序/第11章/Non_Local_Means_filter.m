%%��Non-Local Means�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = im(60:250,60:200);  % ��ȡ���ַ��������Ǳ�������0����ɫ����Ӱ��
% ת��Ϊ�Ҷ�ͼ��
if size(im,3)==1
    im = im;
else
    im = rgb2gray(im);
end
im = imnoise(im,'gaussian',0,1e-3); % ԭͼ�� + ������

D = Non_Local_Means(im,3,3,0.15);  % Ӧ��Non-Local Means�˲�ͼ��
figure,
subplot(121),imshow(im);title('ԭʼͼ��')
colormap(jet)  % ��ɫ
shading interp % ����
subplot(122),imshow(D,[]);title('Non-Local Means�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����

