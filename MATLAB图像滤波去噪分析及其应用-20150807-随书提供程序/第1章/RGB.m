function RGB
clc,clear,close all
warning off
feature jit off
[x,y,z,Tri] = makeshape('Cube');  % 立方形
CData = [x,y,z];
myplot((x-0.5)*0.8,(y-0.5)*0.8,(z)*0.8,Tri,CData); % 绘制图形
coloraxis('R''',5,0.5*0.8);  % 坐标轴标记
coloraxis('G''',6,0.5*0.8); 
coloraxis('B''',3);
view([65 34]);
end

function [x,y,z,Tri] = makeshape(Shape)
% 3D立方形 Cube
N = 12;    % Vertices per edge
% 立方形参数
Nth = 25; Nr = 4;  Nz = 8; 

   [u,v] = meshgrid(linspace(0,1,N),linspace(0,1,N));  % 网格化
   u = u(:);
   v = v(:);
   x = [u;u;u;u;zeros(N^2,1);ones(N^2,1)];
   y = [v;v;zeros(N^2,1);ones(N^2,1);v;v];
   z = [zeros(N^2,1);ones(N^2,1);v;v;u;u];
   Tri = trigrid(N,N);  % 三角形体网格
   Tri = [Tri;N^2+Tri;2*N^2+Tri;3*N^2+Tri;4*N^2+Tri;5*N^2+Tri];
end





