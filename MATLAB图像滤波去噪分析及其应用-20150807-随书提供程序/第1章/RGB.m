function RGB
clc,clear,close all
warning off
feature jit off
[x,y,z,Tri] = makeshape('Cube');  % ������
CData = [x,y,z];
myplot((x-0.5)*0.8,(y-0.5)*0.8,(z)*0.8,Tri,CData); % ����ͼ��
coloraxis('R''',5,0.5*0.8);  % ��������
coloraxis('G''',6,0.5*0.8); 
coloraxis('B''',3);
view([65 34]);
end

function [x,y,z,Tri] = makeshape(Shape)
% 3D������ Cube
N = 12;    % Vertices per edge
% �����β���
Nth = 25; Nr = 4;  Nz = 8; 

   [u,v] = meshgrid(linspace(0,1,N),linspace(0,1,N));  % ����
   u = u(:);
   v = v(:);
   x = [u;u;u;u;zeros(N^2,1);ones(N^2,1)];
   y = [v;v;zeros(N^2,1);ones(N^2,1);v;v];
   z = [zeros(N^2,1);ones(N^2,1);v;v;u;u];
   Tri = trigrid(N,N);  % ������������
   Tri = [Tri;N^2+Tri;2*N^2+Tri;3*N^2+Tri;4*N^2+Tri;5*N^2+Tri];
end





