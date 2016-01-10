function HSI
clc,clear,close all
warning off
feature jit off

   [x,y,z,Tri] = makeshape('Hexacone');
   load CData_HSV.mat
   myplot(x,y,z,Tri,CData);
   coloraxis('H',1);
   coloraxis('S',2);
   coloraxis('V',3);
axis equal;
axis off;
pbaspect([1,1,1]);
view(70,27);
rotate3d on;
end

function [x,y,z,Tri] = makeshape(Shape)
% 3D立方形 Cube
N = 12;    % Vertices per edge
% 立方形参数
Nth = 25; Nr = 4;  Nz = 8; 

   [u,v] = meshgrid(linspace(0,2*pi,Nth),linspace(0,1,Nz));
   Tri = trigrid(Nth,Nz);
   r = 0.92./max(max(abs(cos(u)),abs(cos(u - pi/3))),abs(cos(u + pi/3)));
   x = v(:).*cos(u(:)).*r(:);
   y = v(:).*sin(u(:)).*r(:);
   z = v(:);
   [u,v] = meshgrid(linspace(0,2*pi,Nth),linspace(0,1,Nr));
   Tri = [Tri;Nth*Nz+trigrid(Nth,Nr);];
   v = 0.92*v./max(max(abs(cos(u)),abs(cos(u - pi/3))),abs(cos(u + pi/3)));
   x = [x;v(:).*cos(u(:));];
   y = [y;v(:).*sin(u(:));];
   z = [z;ones(Nth*Nr,1)];
end