function [G,gabout] = gabor_filter(I,Sx,Sy,U,V)
% 函数输入：
%          I : 输入的二维图像
%          Sx & Sy : 方差 along x and y-axes respectively
%          U & V : 中心频率  along x and y-axes respectively
% 函数输出：
%          G : G（x，y）
%          gabout : Gabor滤波图像
% G(x,y)表达式如下：
%               1                -1     x  ^    y  ^
%%% G(x,y) = ---------- * exp ([----{(----) 2+(----) 2}+2*pi*i*(Ux+Vy)])
%            2*pi*sx*sy           2    sx       sy

if isa(I,'double')~=1 
    I = double(I);
end

for x = -fix(Sx):fix(Sx)
    for y = -fix(Sy):fix(Sy)
        G(fix(Sx)+x+1,fix(Sy)+y+1) = (1/(2*pi*Sx*Sy))*exp(-.5*((x/Sx)^2+(y/Sy)^2)+2*pi*i*(U*x+V*y));
    end
end

Imgabout = conv2(I,double(imag(G)),'same');  % 卷积
Regabout = conv2(I,double(real(G)),'same');  % 卷积

gabout = uint8(sqrt(Imgabout.*Imgabout + Regabout.*Regabout)); % 输出滤波图像

