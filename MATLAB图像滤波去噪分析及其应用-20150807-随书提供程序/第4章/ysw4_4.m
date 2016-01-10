clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
D0 = 10; % 阻止的频率点与频域中心的距离
n = 2;  % 阶次
x = 0:.5:80;
y = 0:.5:80;
[X,Y] = meshgrid(x,y);
u0 = 20;
v0 = 50;
for i=1:size(X,1)
    for j=1:size(X,2)
        D1 = sqrt( (X(i,j)-u0).^2 + (Y(i,j) -v0).^2);
        D2 = sqrt( (X(i,j)-v0).^2 + (Y(i,j) -u0).^2);
        Z(i,j) = 1./( 1+ (D0^2./D1./D2).^n);
    end
end
figure('color',[1,1,1])
mesh(X,Y,Z)
