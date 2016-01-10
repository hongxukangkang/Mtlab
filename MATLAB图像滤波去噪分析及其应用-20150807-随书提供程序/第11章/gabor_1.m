%% 一维Gabor滤波器
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
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
