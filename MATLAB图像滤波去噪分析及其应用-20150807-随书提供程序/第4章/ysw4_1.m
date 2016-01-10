clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
D0 = 20; % 阻止的频率点与频域中心的距离
W = 20;  % 带宽
n = 2;  % 阶次
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

