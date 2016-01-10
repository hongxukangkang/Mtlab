function [G,gabout] = gabor_filter(I,Sx,Sy,U,V)
% �������룺
%          I : ����Ķ�άͼ��
%          Sx & Sy : ���� along x and y-axes respectively
%          U & V : ����Ƶ��  along x and y-axes respectively
% ���������
%          G : G��x��y��
%          gabout : Gabor�˲�ͼ��
% G(x,y)���ʽ���£�
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

Imgabout = conv2(I,double(imag(G)),'same');  % ���
Regabout = conv2(I,double(real(G)),'same');  % ���

gabout = uint8(sqrt(Imgabout.*Imgabout + Regabout.*Regabout)); % ����˲�ͼ��

