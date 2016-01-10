%4个方向的Gabo滤波器通过图像显示  
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 0;  
theta = pi*0/4;  % 弧度0,pi/4,pi/2,pi*3/4  
f0 = 1/16;       % 1/lamda   1/4/sqrt(2)  1/8   1/8/sqrt(2)  1/16
for i = linspace(-15,15,50)  
    x = x + 1;  
    y = 0;  
    for j = linspace(-15,15,50)  
        y = y + 1;  
        z(y,x)=compute_gabor(i,j,f0,theta);  
    end  
end  
z_real = real(z);  
m = min(z_real(:));  
z_real = z_real+abs(m);  
M = max(z_real(:));  
imshow(1/M*z_real);  
% figure(2)  
% z_imag = imag(z);  
% m = min(z_imag(:));  
% z_imag = z_imag+abs(m);  
% M = max(z_imag(:));  
% imshow(1/M*z_imag);  