clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
D0 = 20; % ��ֹ��Ƶ�ʵ���Ƶ�����ĵľ���
W = 20;  % ����
n = 2;  % �״�
x = 0:.5:80;
y = 0:.5:80;
[X,Y] = meshgrid(x,y);
for i=1:size(X,1)
    for j=1:size(X,2)
        D = sqrt( (X(i,j)-35).^2 + (Y(i,j) -35).^2  ); 
        Z(i,j)= 1./(1+(D*W./(D.^2-D0^2)).^(2*n));
    end
end
figure('color',[1,1,1])
mesh(X,Y,Z)

