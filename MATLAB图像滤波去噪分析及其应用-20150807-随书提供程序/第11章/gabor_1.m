%% һάGabor�˲���
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x=-4:0.01:4;
t=1;
y=1*exp(-(x.^2)./(sqrt(2*pi)*t^2));
plot(x,y,'b','linewidth',2);
hold on
x1=-4:0.01:4;
y1=1*sin(9*x1+pi/2);
plot(x1,y1,'k','linewidth',1.2);
y2=y.*y1;
plot(x1,y2,'r','linewidth',2)
