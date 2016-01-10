%% gabor滤波器的实部与虚部图像
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 0;  
theta = 0;  
f0 = 0.2;  
for i = linspace(-15,15,50)  
    x = x + 1;  
    y = 0;  
    for j = linspace(-15,15,50)  
        y = y + 1;  
        z(y,x)=compute_gabor(i,j,f0,theta);  
    end  
end  
x = linspace(-15,15,50);  
y = linspace(-15,15,50);  
surf(x,y,real(z))  
title('Gabor filter:实部');  
xlabel('x');  
ylabel('y');  
zlabel('z');  
figure(2);  
surf(x,y,imag(z))  
title('Gabor filter:虚部');  
xlabel('x');  
ylabel('y');  
zlabel('z');  

figure(3)
plot(real(z(1,:,:)),'r','linewidth',2)
hold on
plot(imag(z(1,:,:)),'b--','linewidth',2)
grid on
legend('实部','虚部')