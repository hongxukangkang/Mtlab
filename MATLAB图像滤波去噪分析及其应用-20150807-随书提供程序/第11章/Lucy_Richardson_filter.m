%% Lucy_Richardson�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
[filename ,pathname]=...
    uigetfile({'*.bmp';'*.tif';'*.jpg';},'ѡ��ͼƬ'); %ѡ��ͼƬ·��
str=[pathname filename]; % �ϳ�·��+�ļ���
im = imread(str);        % ��ͼ
im = im(40:250,40:220);  % ��ȡ���ַ��������Ǳ�������0����ɫ����Ӱ��
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
im1 = Lucy_Richardson(im, 5, 10, 50);
subplot(122),imshow(uint8(im1));title('Lucy_Richardson�˲�ͼ��')
colormap(jet)  % ��ɫ
shading interp % ����




