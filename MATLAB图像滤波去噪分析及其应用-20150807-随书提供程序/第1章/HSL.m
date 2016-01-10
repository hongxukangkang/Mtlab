function HSL
clc,clear,close all
warning off
feature jit off

   [x,y,z,Tri] = makeshape('Double Hexacone');
   load CData_HSL.mat
   myplot(x,y,2*z,Tri,CData);
   coloraxis('H',1);
   coloraxis('S',2);   
   coloraxis('L',4);
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

   Nz = floor(Nz/2)*2+1;
   [u,v] = meshgrid(linspace(0,2*pi,Nth),linspace(0,1,Nz));
   Tri = trigrid(Nth,Nz);
   r = 1 - abs(2*v - 1);
   r = 0.92*r./max(max(abs(cos(u)),abs(cos(u - pi/3))),abs(cos(u + pi/3)));
   x = r(:).*cos(u(:));
   y = r(:).*sin(u(:));
   z = v(:);   
end