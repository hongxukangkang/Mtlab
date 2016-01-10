clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
D0 = 10; % ��ֹ��Ƶ�ʵ���Ƶ�����ĵľ���
W = 10;  % ����
n = 2;  % �״�
x = 0:.5:80;
y = 0:.5:80;
[X,Y] = meshgrid(x,y);
for i=1:size(X,1)
    for j=1:size(X,2)
        D = sqrt( (X(i,j)-35).^2 + (Y(i,j) -35).^2  ); 
        Z(i,j)= 1-exp(-(1/2).*((D.^2-D0^2)./(D*W)).^2);
    end
end
figure('color',[1,1,1])
mesh(X,Y,Z)

